import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import 'package:get_it/get_it.dart';
import 'package:template_app/app/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/database/database.dart';
import '../model/auth_user_model.dart';

class AuthRepository {
  final Database _database = GetIt.instance<Database>();
  final AppSharedPreferences _prefs = GetIt.instance<AppSharedPreferences>();

  /// Login user with username and password
  /// Returns AuthUserModel if successful, throws exception otherwise
  Future<AuthUserModel> login(String username, String password) async {
    try {
      // Query user by login
      final result = await _database
          .customSelect(
            '''
        SELECT 
          u.codusuario, 
          u.descnome, 
          u.desclogin, 
          u.descemail, 
          u.descsenha,
          un.descunidade,
          p.descperfil
        FROM tafusuario u
        LEFT JOIN tafunidade un ON u.codunidade = un.codunidade
        LEFT JOIN tafperfil p ON u.codperfil = p.codperfil
        WHERE u.desclogin = ?
        ''',
            variables: [Variable.withString(username)],
          )
          .getSingleOrNull();

      if (result == null) {
        throw Exception('Usuário ou senha inválidos');
      }

      // Verify password with bcrypt
      final storedHash = result.read<String>('descsenha');
      final isValidPassword = BCrypt.checkpw(password, storedHash);

      if (!isValidPassword) {
        throw Exception('Usuário ou senha inválidos');
      }

      // Save user ID to SharedPreferences
      final userId = result.read<String>('codusuario');
      _prefs.setAuthUserId(userId);

      // Return user model
      return AuthUserModel(
        codusuario: userId,
        descnome: result.read<String>('descnome'),
        desclogin: result.read<String>('desclogin'),
        descemail: result.read<String>('descemail'),
        descunidade: result.read<String?>('descunidade') ?? '',
        descperfil: result.read<String?>('descperfil') ?? '',
      );
    } catch (e) {
      throw Exception('Erro ao realizar login: ${e.toString()}');
    }
  }

  /// Logout current user
  Future<void> logout() async {
    _prefs.clearAuth();
  }

  /// Get current authenticated user
  /// Returns AuthUserModel if user is authenticated, throws exception otherwise
  Future<AuthUserModel> getCurrentUser() async {
    try {
      final userId = _prefs.getAuthUserId();
      if (userId == null) {
        throw Exception('Usuário não autenticado');
      }

      final result = await _database
          .customSelect(
            '''
        SELECT 
          u.codusuario, 
          u.descnome, 
          u.desclogin, 
          u.descemail,
          un.descunidade,
          p.descperfil
        FROM tafusuario u
        LEFT JOIN tafunidade un ON u.codunidade = un.codunidade
        LEFT JOIN tafperfil p ON u.codperfil = p.codperfil
        WHERE u.codusuario = ?
        ''',
            variables: [Variable.withString(userId)],
          )
          .getSingleOrNull();

      if (result == null) {
        throw Exception('Usuário não encontrado');
      }

      return AuthUserModel(
        codusuario: result.read<String>('codusuario'),
        descnome: result.read<String>('descnome'),
        desclogin: result.read<String>('desclogin'),
        descemail: result.read<String>('descemail'),
        descunidade: result.read<String?>('descunidade') ?? '',
        descperfil: result.read<String?>('descperfil') ?? '',
      );
    } catch (e) {
      throw Exception('Erro ao buscar usuário: ${e.toString()}');
    }
  }

  /// Update user information (name, login, and optionally password)
  /// If password is null, keeps existing password
  Future<void> updateUser(String nome, String login, String? senha) async {
    try {
      final userId = _prefs.getAuthUserId();
      if (userId == null) {
        throw Exception('Usuário não autenticado');
      }

      // Prepare update companion

      // If password is provided, hash it and add to update
      if (senha != null && senha.isNotEmpty) {
        final hashedPassword = BCrypt.hashpw(senha, BCrypt.gensalt());
        await _database.customUpdate(
          '''
          UPDATE tafusuario 
          SET descnome = ?, desclogin = ?, descsenha = ?
          WHERE codusuario = ?
          ''',
          variables: [
            Variable.withString(nome),
            Variable.withString(login),
            Variable.withString(hashedPassword),
            Variable.withString(userId),
          ],
          updates: {_database.tafusuario},
        );
      } else {
        // Update without password
        await _database.customUpdate(
          '''
          UPDATE tafusuario 
          SET descnome = ?, desclogin = ?
          WHERE codusuario = ?
          ''',
          variables: [
            Variable.withString(nome),
            Variable.withString(login),
            Variable.withString(userId),
          ],
          updates: {_database.tafusuario},
        );
      }
    } catch (e) {
      throw Exception('Erro ao atualizar usuário: ${e.toString()}');
    }
  }
}
