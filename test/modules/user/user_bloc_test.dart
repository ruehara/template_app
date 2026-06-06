import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:template_app/modules/user/blocs/user_bloc.dart';
import 'package:template_app/modules/user/blocs/user_events.dart';
import 'package:template_app/modules/user/blocs/user_states.dart';
import 'package:template_app/modules/user/model/user_model.dart';
import 'package:template_app/modules/user/repository/i_user_repository.dart';

class MockUserRepository extends Mock implements IUserRepository {}

void main() {
  late UserBloc userBloc;
  late MockUserRepository mockUserRepository;

  final testUsers = [
    UserModel(
      id: 'abc-123',
      age: 30,
      name: 'John Doe',
      profilePicture: 'https://example.com/pic.jpg',
    ),
  ];

  setUp(() {
    mockUserRepository = MockUserRepository();
    userBloc = UserBloc(mockUserRepository);
  });

  tearDown(() {
    userBloc.close();
  });

  group('UserBloc - LoadUserEvent', () {
    blocTest<UserBloc, UserState>(
      'emits [UserLoadingState, UserLoadedState] when getUsers succeeds',
      build: () {
        when(
          () => mockUserRepository.getUsers(),
        ).thenAnswer((_) async => testUsers);
        return userBloc;
      },
      act: (bloc) => bloc.add(const LoadUserEvent()),
      expect: () => [
        isA<UserLoadingState>(),
        isA<UserLoadedState>().having(
          (state) => state.users,
          'users',
          equals(testUsers),
        ),
      ],
      verify: (_) {
        verify(() => mockUserRepository.getUsers()).called(1);
      },
    );

    blocTest<UserBloc, UserState>(
      'emits [UserLoadingState, UserErrorState] when getUsers throws',
      build: () {
        when(
          () => mockUserRepository.getUsers(),
        ).thenThrow(Exception('Network error'));
        return userBloc;
      },
      act: (bloc) => bloc.add(const LoadUserEvent()),
      expect: () => [
        isA<UserLoadingState>(),
        isA<UserErrorState>().having(
          (state) => state.error,
          'error',
          contains('Network error'),
        ),
      ],
    );
  });
}
