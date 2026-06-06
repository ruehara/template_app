import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';
import 'package:template_app/core/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/core/utils/exceptions.dart';
import 'package:uuid/uuid.dart';
import '../model/auth_user_model.dart';
import 'i_auth_repository.dart';

class AuthRepository implements IAuthRepository {
  AuthRepository({
    required this._database,
    required this._prefs,
  });

  final Database _database;
  final AppSharedPreferences _prefs;

  @override
  Future<AuthUserModel> login(String username, String password) async {
    try {
      final query = _database.select(_database.tafusuario).join([
        leftOuterJoin(
          _database.tafunidade,
          _database.tafunidade.codunidade.equalsExp(
            _database.tafusuario.codunidade,
          ),
        ),
        leftOuterJoin(
          _database.tafperfil,
          _database.tafperfil.codperfil.equalsExp(
            _database.tafusuario.codperfil,
          ),
        ),
      ])..where(_database.tafusuario.desclogin.equals(username));

      final row = await query.getSingleOrNull();
      if (row == null) {
        throw const AuthException(AppErrorCode.invalidCredentials);
      }

      final usuario = row.readTable(_database.tafusuario);
      if (!BCrypt.checkpw(password, usuario.descsenha)) {
        throw const AuthException(AppErrorCode.invalidCredentials);
      }

      _prefs.setAuthUserId(usuario.codusuario);
      return _buildAuthUser(row);
    } on AppException {
      rethrow;
    } catch (e) {
      throw DatabaseException(
        AppErrorCode.database,
        details: 'Erro ao realizar login: $e',
      );
    }
  }

  @override
  Future<void> logout() async {
    _prefs.clearAuth();
  }

  @override
  Future<AuthUserModel> getCurrentUser() async {
    try {
      final userId = _prefs.getAuthUserId();
      if (userId == null) {
        throw const AuthException(AppErrorCode.notAuthenticated);
      }

      final query = _database.select(_database.tafusuario).join([
        leftOuterJoin(
          _database.tafunidade,
          _database.tafunidade.codunidade.equalsExp(
            _database.tafusuario.codunidade,
          ),
        ),
        leftOuterJoin(
          _database.tafperfil,
          _database.tafperfil.codperfil.equalsExp(
            _database.tafusuario.codperfil,
          ),
        ),
      ])..where(_database.tafusuario.codusuario.equals(userId));

      final row = await query.getSingleOrNull();
      if (row == null) {
        throw const DatabaseException(AppErrorCode.userNotFound);
      }

      return _buildAuthUser(row);
    } on AppException {
      rethrow;
    } catch (e) {
      throw DatabaseException(
        AppErrorCode.database,
        details: 'Erro ao buscar usuário: $e',
      );
    }
  }

  @override
  Future<void> updateUser(String nome, String login, String? senha) async {
    try {
      final userId = _prefs.getAuthUserId();
      if (userId == null) {
        throw const AuthException(AppErrorCode.notAuthenticated);
      }

      final companion = (senha != null && senha.isNotEmpty)
          ? TafusuarioCompanion(
              descnome: Value(nome),
              desclogin: Value(login),
              descsenha: Value(BCrypt.hashpw(senha, BCrypt.gensalt())),
            )
          : TafusuarioCompanion(
              descnome: Value(nome),
              desclogin: Value(login),
            );

      await (_database.update(_database.tafusuario)
            ..where((u) => u.codusuario.equals(userId)))
          .write(companion);
    } on AppException {
      rethrow;
    } catch (e) {
      throw DatabaseException(
        AppErrorCode.database,
        details: 'Erro ao atualizar usuário: $e',
      );
    }
  }

  @override
  Future<void> register({
    required String name,
    required String login,
    required String email,
    required String password,
  }) async {
    try {
      final existingUser =
          await (_database.select(_database.tafusuario)
                ..where((u) => u.desclogin.equals(login)))
              .getSingleOrNull();
      if (existingUser != null) {
        throw const AuthException(AppErrorCode.userAlreadyExists);
      }

      final unidade = await _database
          .select(_database.tafunidade)
          .getSingleOrNull();
      if (unidade == null) {
        throw const DatabaseException(AppErrorCode.noUnit);
      }

      final perfil = await _database
          .select(_database.tafperfil)
          .getSingleOrNull();
      if (perfil == null) {
        throw const DatabaseException(AppErrorCode.noProfile);
      }

      final equipe = await _database
          .select(_database.tafequipe)
          .getSingleOrNull();
      if (equipe == null) {
        throw const DatabaseException(AppErrorCode.noTeam);
      }

      await _database
          .into(_database.tafusuario)
          .insert(
            TafusuarioCompanion.insert(
              codusuario: const Uuid().v4(),
              codunidade: unidade.codunidade,
              codperfil: perfil.codperfil,
              codequipe: equipe.codequipe,
              descnome: name,
              desclogin: login,
              descemail: email,
              descsenha: BCrypt.hashpw(password, BCrypt.gensalt()),
            ),
          );
    } on AppException {
      rethrow;
    } catch (e) {
      throw DatabaseException(
        AppErrorCode.database,
        details: 'Erro ao registrar usuário: $e',
      );
    }
  }

  AuthUserModel _buildAuthUser(TypedResult row) {
    final usuario = row.readTable(_database.tafusuario);
    final unidade = row.readTableOrNull(_database.tafunidade);
    final perfil = row.readTableOrNull(_database.tafperfil);
    return AuthUserModel(
      codusuario: usuario.codusuario,
      descnome: usuario.descnome,
      desclogin: usuario.desclogin,
      descemail: usuario.descemail,
      descunidade: unidade?.descunidade ?? '',
      descperfil: perfil?.descperfil ?? '',
    );
  }
}
