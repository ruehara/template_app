import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../model/user_model.dart';

class UserRepository {
  var url = Uri.http('randomuser.me', '/api/', {'results': '50'});
  Future<List<UserModel>> getUsers() async {
    var client = http.Client();
    Response response;
    try {
      response = await client.get(url);

      if (response.statusCode == 200) {
        final List result = convert.jsonDecode(response.body)['results'];
        return result.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('response.reasonPhrase');
    }
  }
}
