import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:template_app/core/utils/exceptions.dart';

import '../model/user_model.dart';
import 'i_user_repository.dart';

class UserRepository implements IUserRepository {
  UserRepository({this._client});

  final http.Client? _client;
  static final Uri _url = Uri.https('randomuser.me', '/api/', {
    'results': '50',
  });

  @override
  Future<List<UserModel>> getUsers() async {
    final client = _client ?? http.Client();
    final shouldClose = _client == null;
    try {
      final Response response = await client.get(_url);

      if (response.statusCode == 200) {
        final List<dynamic> result =
            convert.jsonDecode(response.body)['results'] as List<dynamic>;
        return result
            .map((e) => UserModel.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw NetworkException(
          response.reasonPhrase ?? 'Erro desconhecido (${response.statusCode})',
        );
      }
    } on AppException {
      rethrow;
    } catch (e) {
      throw NetworkException('Erro ao buscar usuários: $e');
    } finally {
      if (shouldClose) client.close();
    }
  }
}
