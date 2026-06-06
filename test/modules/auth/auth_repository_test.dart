import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/database/tables/schema.drift.dart';
import 'package:template_app/core/utils/exceptions.dart';
import 'package:template_app/modules/auth/repository/auth_repository.dart';
import '../../helpers/mock_shared_preferences.dart';

Database _createTestDatabase() =>
    Database(DatabaseConnection(NativeDatabase.memory()));

Future<void> _insertTestUser(
  Database db, {
  required String codusuario,
  required String desclogin,
  required String descsenha,
  String descnome = 'Test User',
  String descemail = 'test@test.com',
  String codunidade = 'U01',
  String codperfil = 'P01',
  String codequipe = 'E01',
}) async {
  await db.batch((b) {
    b.insert(
      db.tafunidade,
      TafunidadeCompanion.insert(
        codunidade: codunidade,
        descunidade: 'Unidade 01',
      ),
      mode: InsertMode.insertOrReplace,
    );
    b.insert(
      db.tafperfil,
      TafperfilCompanion.insert(
        codperfil: codperfil,
        descperfil: 'Administrador',
      ),
      mode: InsertMode.insertOrReplace,
    );
    b.insert(
      db.tafequipe,
      TafequipeCompanion.insert(
        codequipe: codequipe,
        desequipe: 'Equipe 01',
        codunidade: codunidade,
        cdeqpai: codequipe,
      ),
      mode: InsertMode.insertOrReplace,
    );
    b.insert(
      db.tafusuario,
      TafusuarioCompanion.insert(
        codusuario: codusuario,
        codunidade: codunidade,
        codperfil: codperfil,
        codequipe: codequipe,
        descnome: descnome,
        desclogin: desclogin,
        descemail: descemail,
        descsenha: descsenha,
      ),
      mode: InsertMode.insertOrReplace,
    );
  });
}

void main() {
  late AuthRepository authRepository;
  late Database database;
  late MockAppSharedPreferences mockPrefs;

  setUp(() async {
    database = _createTestDatabase();
    await database.customStatement('PRAGMA foreign_keys = OFF');
    mockPrefs = MockAppSharedPreferences();
    authRepository = AuthRepository(database: database, prefs: mockPrefs);
  });

  tearDown(() async {
    await database.close();
  });

  group('AuthRepository - login', () {
    test('should return AuthUserModel when credentials are valid', () async {
      const password = '123456';
      final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
      await _insertTestUser(
        database,
        codusuario: '0001',
        desclogin: 'rodrigo',
        descsenha: hashedPassword,
        descnome: 'Rodrigo Uehara',
        descemail: 'rodrigo@email.com',
      );

      when(() => mockPrefs.setAuthUserId(any())).thenAnswer((_) async {});

      final result = await authRepository.login('rodrigo', password);

      expect(result.codusuario, '0001');
      expect(result.descnome, 'Rodrigo Uehara');
      expect(result.desclogin, 'rodrigo');
      expect(result.descemail, 'rodrigo@email.com');
      verify(() => mockPrefs.setAuthUserId('0001')).called(1);
    });

    test('should throw AuthException when user is not found', () async {
      expect(
        () => authRepository.login('nonexistent', 'wrong'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.code,
            'code',
            AppErrorCode.invalidCredentials,
          ),
        ),
      );
    });

    test('should throw AuthException when password is incorrect', () async {
      final hashedPassword = BCrypt.hashpw('123456', BCrypt.gensalt());
      await _insertTestUser(
        database,
        codusuario: '0001',
        desclogin: 'rodrigo',
        descsenha: hashedPassword,
      );

      expect(
        () => authRepository.login('rodrigo', 'wrongpassword'),
        throwsA(
          isA<AuthException>().having(
            (e) => e.code,
            'code',
            AppErrorCode.invalidCredentials,
          ),
        ),
      );
    });
  });

  group('AuthRepository - logout', () {
    test('should clear authentication data', () async {
      when(() => mockPrefs.clearAuth()).thenAnswer((_) async {});

      await authRepository.logout();

      verify(() => mockPrefs.clearAuth()).called(1);
    });
  });

  group('AuthRepository - getCurrentUser', () {
    test('should return user when authenticated', () async {
      const userId = '0001';
      final hashedPassword = BCrypt.hashpw('pass', BCrypt.gensalt());
      await _insertTestUser(
        database,
        codusuario: userId,
        desclogin: 'rodrigo',
        descsenha: hashedPassword,
        descnome: 'Rodrigo Uehara',
        descemail: 'rodrigo@email.com',
      );

      when(() => mockPrefs.getAuthUserId()).thenReturn(userId);

      final result = await authRepository.getCurrentUser();

      expect(result.codusuario, userId);
      expect(result.descnome, 'Rodrigo Uehara');
    });

    test('should throw AuthException when not authenticated', () async {
      when(() => mockPrefs.getAuthUserId()).thenReturn(null);

      expect(
        () => authRepository.getCurrentUser(),
        throwsA(
          isA<AuthException>().having(
            (e) => e.code,
            'code',
            AppErrorCode.notAuthenticated,
          ),
        ),
      );
    });
  });

  group('AuthRepository - updateUser', () {
    test(
      'should update name, login and password when senha is provided',
      () async {
        final hashedPassword = BCrypt.hashpw('oldpass', BCrypt.gensalt());
        await _insertTestUser(
          database,
          codusuario: '0001',
          desclogin: 'rodrigo',
          descsenha: hashedPassword,
          descnome: 'Old Name',
        );
        when(() => mockPrefs.getAuthUserId()).thenReturn('0001');

        await authRepository.updateUser('New Name', 'newlogin', 'newpass');

        final user = await (database.select(
          database.tafusuario,
        )..where((u) => u.codusuario.equals('0001'))).getSingleOrNull();
        expect(user?.descnome, 'New Name');
        expect(user?.desclogin, 'newlogin');
        expect(BCrypt.checkpw('newpass', user!.descsenha), isTrue);
      },
    );

    test(
      'should update name and login without changing password when senha is null',
      () async {
        final hashedPassword = BCrypt.hashpw('oldpass', BCrypt.gensalt());
        await _insertTestUser(
          database,
          codusuario: '0001',
          desclogin: 'rodrigo',
          descsenha: hashedPassword,
          descnome: 'Old Name',
        );
        when(() => mockPrefs.getAuthUserId()).thenReturn('0001');

        await authRepository.updateUser('New Name', 'newlogin', null);

        final user = await (database.select(
          database.tafusuario,
        )..where((u) => u.codusuario.equals('0001'))).getSingleOrNull();
        expect(user?.descnome, 'New Name');
        expect(user?.desclogin, 'newlogin');
        expect(user?.descsenha, hashedPassword);
      },
    );

    test('should throw AuthException when user is not authenticated', () {
      when(() => mockPrefs.getAuthUserId()).thenReturn(null);

      expect(
        () => authRepository.updateUser('Name', 'login', null),
        throwsA(isA<AuthException>()),
      );
    });
  });

  group('AuthRepository - register', () {
    test('should insert a new user into the database', () async {
      await _insertTestUser(
        database,
        codusuario: '0001',
        desclogin: 'existing',
        descsenha: 'hash',
      );

      await authRepository.register(
        name: 'New User',
        login: 'newuser',
        email: 'newuser@example.com',
        password: 'password123',
      );

      final user = await (database.select(
        database.tafusuario,
      )..where((u) => u.desclogin.equals('newuser'))).getSingleOrNull();
      expect(user != null, isTrue);
      expect(user?.descnome, 'New User');
      expect(BCrypt.checkpw('password123', user!.descsenha), isTrue);
    });

    test('should throw AuthException when login already exists', () async {
      await _insertTestUser(
        database,
        codusuario: '0001',
        desclogin: 'rodrigo',
        descsenha: BCrypt.hashpw('pass', BCrypt.gensalt()),
      );

      expect(
        () => authRepository.register(
          name: 'Rodrigo',
          login: 'rodrigo',
          email: 'rodrigo@example.com',
          password: 'pass',
        ),
        throwsA(isA<AuthException>()),
      );
    });

    test('should throw DatabaseException when no unidade exists', () {
      expect(
        () => authRepository.register(
          name: 'New User',
          login: 'newuser',
          email: 'newuser@example.com',
          password: 'pass',
        ),
        throwsA(isA<DatabaseException>()),
      );
    });
  });
}
