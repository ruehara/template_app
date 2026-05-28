import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:template_app/core/utils/exceptions.dart';
import 'package:template_app/modules/user/repository/user_repository.dart';

class MockHttpClient extends Mock implements http.Client {}

const _validResponseBody = '''
{
  "results": [
    {
      "login": {"uuid": "abc-123"},
      "dob": {"age": 30},
      "name": {"first": "John", "last": "Doe"},
      "picture": {"large": "https://example.com/pic.jpg"}
    }
  ]
}
''';

void main() {
  late UserRepository userRepository;
  late MockHttpClient mockClient;

  setUpAll(() {
    registerFallbackValue(Uri.parse('https://fallback.com'));
  });

  setUp(() {
    mockClient = MockHttpClient();
    userRepository = UserRepository(client: mockClient);
  });

  group('UserRepository - getUsers', () {
    test('should return a list of UserModel on HTTP 200', () async {
      when(
        () => mockClient.get(any()),
      ).thenAnswer((_) async => http.Response(_validResponseBody, 200));

      final users = await userRepository.getUsers();

      expect(users.length, 1);
      expect(users.first.id, 'abc-123');
      expect(users.first.name, 'John Doe');
      expect(users.first.age, 30);
      expect(users.first.profilePicture, 'https://example.com/pic.jpg');
    });

    test('should throw NetworkException when status code is not 200', () async {
      when(() => mockClient.get(any())).thenAnswer(
        (_) async => http.Response('Not Found', 404, reasonPhrase: 'Not Found'),
      );

      expect(
        () => userRepository.getUsers(),
        throwsA(
          isA<NetworkException>().having(
            (e) => e.message,
            'message',
            contains('Not Found'),
          ),
        ),
      );
    });

    test('should throw NetworkException when HTTP call throws', () async {
      when(
        () => mockClient.get(any()),
      ).thenThrow(Exception('Connection refused'));

      expect(() => userRepository.getUsers(), throwsA(isA<NetworkException>()));
    });
  });
}
