import 'package:bcrypt/bcrypt.dart';
import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/core/database/database.dart';
import 'package:template_app/core/services/shared_prefs/shared_preferences.dart';
import 'package:template_app/modules/auth/repository/auth_repository.dart';
import '../../helpers/mock_database.dart';
import '../../helpers/mock_shared_preferences.dart';
import '../../helpers/test_helpers.dart';

void main() {
  late AuthRepository authRepository;
  late MockDatabase mockDatabase;
  late MockAppSharedPreferences mockPrefs;
  late GetIt getIt;

  setUp(() {
    resetGetIt();
    getIt = GetIt.instance;
    mockDatabase = MockDatabase();
    mockPrefs = MockAppSharedPreferences();

    // Register mocks in GetIt
    getIt.registerSingleton<Database>(mockDatabase);
    getIt.registerSingleton<AppSharedPreferences>(mockPrefs);

    authRepository = AuthRepository();
  });

  tearDown(() {
    getIt.reset();
  });

  group('AuthRepository - login', () {
    test('should return AuthUserModel when credentials are valid', () async {
      // Arrange
      const username = 'rodrigo';
      const password = '123456';
      final hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

      final mockRow = MockQueryRow();
      when(() => mockRow.read<String>('codusuario')).thenReturn('0001');
      when(() => mockRow.read<String>('descnome')).thenReturn('Rodrigo Uehara');
      when(() => mockRow.read<String>('desclogin')).thenReturn(username);
      when(
        () => mockRow.read<String>('descemail'),
      ).thenReturn('rodrigo@email.com');
      when(() => mockRow.read<String>('descsenha')).thenReturn(hashedPassword);
      when(() => mockRow.read<String?>('descunidade')).thenReturn('Unidade 01');
      when(
        () => mockRow.read<String?>('descperfil'),
      ).thenReturn('Administrador');

      final mockSelectable = MockSelectable<QueryRow>();
      when(
        () => mockSelectable.getSingleOrNull(),
      ).thenAnswer((_) async => mockRow);

      when(
        () => mockDatabase.customSelect(
          any(),
          variables: any(named: 'variables'),
        ),
      ).thenReturn(mockSelectable);

      when(() => mockPrefs.setAuthUserId(any())).thenAnswer((_) async {});

      // Act
      final result = await authRepository.login(username, password);

      // Assert
      expect(result.codusuario, '0001');
      expect(result.descnome, 'Rodrigo Uehara');
      expect(result.desclogin, username);
      expect(result.descemail, 'rodrigo@email.com');
      verify(() => mockPrefs.setAuthUserId('0001')).called(1);
    });

    test('should throw exception when user is not found', () async {
      // Arrange
      const username = 'nonexistent';
      const password = 'wrong';

      final mockSelectable = MockSelectable<QueryRow>();
      when(
        () => mockSelectable.getSingleOrNull(),
      ).thenAnswer((_) async => null);

      when(
        () => mockDatabase.customSelect(
          any(),
          variables: any(named: 'variables'),
        ),
      ).thenReturn(mockSelectable);

      // Act & Assert
      expect(
        () => authRepository.login(username, password),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Usuário ou senha inválidos'),
          ),
        ),
      );
    });

    test('should throw exception when password is incorrect', () async {
      // Arrange
      const username = 'rodrigo';
      const password = 'wrongpassword';
      final hashedPassword = BCrypt.hashpw('123456', BCrypt.gensalt());

      final mockRow = MockQueryRow();
      when(() => mockRow.read<String>('descsenha')).thenReturn(hashedPassword);

      final mockSelectable = MockSelectable<QueryRow>();
      when(
        () => mockSelectable.getSingleOrNull(),
      ).thenAnswer((_) async => mockRow);

      when(
        () => mockDatabase.customSelect(
          any(),
          variables: any(named: 'variables'),
        ),
      ).thenReturn(mockSelectable);

      // Act & Assert
      expect(
        () => authRepository.login(username, password),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Usuário ou senha inválidos'),
          ),
        ),
      );
    });
  });

  group('AuthRepository - logout', () {
    test('should clear authentication data', () async {
      // Arrange
      when(() => mockPrefs.clearAuth()).thenAnswer((_) async {});

      // Act
      await authRepository.logout();

      // Assert
      verify(() => mockPrefs.clearAuth()).called(1);
    });
  });

  group('AuthRepository - getCurrentUser', () {
    test('should return user when authenticated', () async {
      // Arrange
      const userId = '0001';
      when(() => mockPrefs.getAuthUserId()).thenReturn(userId);

      final mockRow = MockQueryRow();
      when(() => mockRow.read<String>('codusuario')).thenReturn(userId);
      when(() => mockRow.read<String>('descnome')).thenReturn('Rodrigo Uehara');
      when(() => mockRow.read<String>('desclogin')).thenReturn('rodrigo');
      when(
        () => mockRow.read<String>('descemail'),
      ).thenReturn('rodrigo@email.com');
      when(() => mockRow.read<String?>('descunidade')).thenReturn('Unidade 01');
      when(
        () => mockRow.read<String?>('descperfil'),
      ).thenReturn('Administrador');

      final mockSelectable = MockSelectable<QueryRow>();
      when(
        () => mockSelectable.getSingleOrNull(),
      ).thenAnswer((_) async => mockRow);

      when(
        () => mockDatabase.customSelect(
          any(),
          variables: any(named: 'variables'),
        ),
      ).thenReturn(mockSelectable);

      // Act
      final result = await authRepository.getCurrentUser();

      // Assert
      expect(result.codusuario, userId);
      expect(result.descnome, 'Rodrigo Uehara');
    });

    test('should throw exception when not authenticated', () async {
      // Arrange
      when(() => mockPrefs.getAuthUserId()).thenReturn(null);

      // Act & Assert
      expect(
        () => authRepository.getCurrentUser(),
        throwsA(
          isA<Exception>().having(
            (e) => e.toString(),
            'message',
            contains('Usuário não autenticado'),
          ),
        ),
      );
    });
  });
}
