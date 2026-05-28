import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/modules/auth/blocs/auth_bloc.dart';
import 'package:template_app/modules/auth/blocs/auth_events.dart';
import 'package:template_app/modules/auth/blocs/auth_states.dart';
import 'package:template_app/modules/auth/model/auth_user_model.dart';
import 'package:template_app/modules/auth/repository/i_auth_repository.dart';

class MockAuthRepository extends Mock implements IAuthRepository {}

void main() {
  late AuthBloc authBloc;
  late MockAuthRepository mockAuthRepository;

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    authBloc = AuthBloc(mockAuthRepository);
  });

  tearDown(() {
    authBloc.close();
  });

  group('AuthBloc - LoginEvent', () {
    const testUser = AuthUserModel(
      codusuario: '0001',
      descnome: 'Test User',
      desclogin: 'testuser',
      descemail: 'test@email.com',
      descunidade: 'Unit 01',
      descperfil: 'Admin',
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when login is successful',
      build: () {
        when(
          () => mockAuthRepository.login('testuser', 'password'),
        ).thenAnswer((_) async => testUser);
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const LoginEvent(username: 'testuser', password: 'password'),
      ),
      expect: () => [const AuthLoading(), const Authenticated(testUser)],
      verify: (_) {
        verify(
          () => mockAuthRepository.login('testuser', 'password'),
        ).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when login fails',
      build: () {
        when(
          () => mockAuthRepository.login('testuser', 'wrongpassword'),
        ).thenThrow(Exception('Invalid credentials'));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const LoginEvent(username: 'testuser', password: 'wrongpassword'),
      ),
      expect: () => [
        const AuthLoading(),
        isA<AuthError>().having(
          (state) => state.message,
          'message',
          contains('Invalid credentials'),
        ),
      ],
    );
  });

  group('AuthBloc - LogoutEvent', () {
    blocTest<AuthBloc, AuthState>(
      'emits [Unauthenticated] when logout is successful',
      build: () {
        when(() => mockAuthRepository.logout()).thenAnswer((_) async {});
        return authBloc;
      },
      act: (bloc) => bloc.add(const LogoutEvent()),
      expect: () => [const Unauthenticated()],
      verify: (_) {
        verify(() => mockAuthRepository.logout()).called(1);
      },
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthError] when logout fails',
      build: () {
        when(
          () => mockAuthRepository.logout(),
        ).thenThrow(Exception('Logout failed'));
        return authBloc;
      },
      act: (bloc) => bloc.add(const LogoutEvent()),
      expect: () => [isA<AuthError>()],
    );
  });

  group('AuthBloc - CheckAuthEvent', () {
    const testUser = AuthUserModel(
      codusuario: '0001',
      descnome: 'Test User',
      desclogin: 'testuser',
      descemail: 'test@email.com',
      descunidade: 'Unit 01',
      descperfil: 'Admin',
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when user is authenticated',
      build: () {
        when(
          () => mockAuthRepository.getCurrentUser(),
        ).thenAnswer((_) async => testUser);
        return authBloc;
      },
      act: (bloc) => bloc.add(const CheckAuthEvent()),
      expect: () => [const AuthLoading(), const Authenticated(testUser)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Unauthenticated] when user is not authenticated',
      build: () {
        when(
          () => mockAuthRepository.getCurrentUser(),
        ).thenThrow(Exception('Not authenticated'));
        return authBloc;
      },
      act: (bloc) => bloc.add(const CheckAuthEvent()),
      expect: () => [const AuthLoading(), const Unauthenticated()],
    );
  });

  group('AuthBloc - RegisterEvent', () {
    const testUser = AuthUserModel(
      codusuario: '0002',
      descnome: 'New User',
      desclogin: 'newuser',
      descemail: 'newuser@email.com',
      descunidade: 'Unit 01',
      descperfil: 'User',
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, Authenticated] when registration succeeds and auto-login',
      build: () {
        when(
          () => mockAuthRepository.register(
            name: 'New User',
            login: 'newuser',
            email: 'newuser@email.com',
            password: 'password123',
          ),
        ).thenAnswer((_) async {});
        when(
          () => mockAuthRepository.login('newuser', 'password123'),
        ).thenAnswer((_) async => testUser);
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const RegisterEvent(
          name: 'New User',
          login: 'newuser',
          email: 'newuser@email.com',
          password: 'password123',
        ),
      ),
      expect: () => [const AuthLoading(), const Authenticated(testUser)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when registration fails',
      build: () {
        when(
          () => mockAuthRepository.register(
            name: any(named: 'name'),
            login: any(named: 'login'),
            email: any(named: 'email'),
            password: any(named: 'password'),
          ),
        ).thenThrow(Exception('Registration failed'));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const RegisterEvent(
          name: 'New User',
          login: 'newuser',
          email: 'newuser@email.com',
          password: 'password123',
        ),
      ),
      expect: () => [const AuthLoading(), isA<AuthError>()],
    );
  });

  group('AuthBloc - UpdateUserEvent', () {
    const testUser = AuthUserModel(
      codusuario: '0001',
      descnome: 'Updated User',
      desclogin: 'updateduser',
      descemail: 'updated@email.com',
      descunidade: 'Unit 01',
      descperfil: 'Admin',
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, UserUpdated, Authenticated] when update succeeds',
      build: () {
        when(
          () => mockAuthRepository.updateUser(
            'Updated User',
            'updateduser',
            'newpass',
          ),
        ).thenAnswer((_) async {});
        when(
          () => mockAuthRepository.getCurrentUser(),
        ).thenAnswer((_) async => testUser);
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const UpdateUserEvent(
          nome: 'Updated User',
          login: 'updateduser',
          senha: 'newpass',
        ),
      ),
      expect: () => [
        const AuthLoading(),
        const UserUpdated(),
        const Authenticated(testUser),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [AuthLoading, AuthError] when update fails',
      build: () {
        when(
          () => mockAuthRepository.updateUser(any(), any(), any()),
        ).thenThrow(Exception('Update failed'));
        return authBloc;
      },
      act: (bloc) => bloc.add(
        const UpdateUserEvent(nome: 'Name', login: 'login', senha: null),
      ),
      expect: () => [const AuthLoading(), isA<AuthError>()],
    );
  });
}
