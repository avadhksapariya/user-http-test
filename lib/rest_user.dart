import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_http_test/model_user.dart';

class RESTUser {
  final http.Client client;

  RESTUser(this.client);

  Future<ModelUser?> getUser() async {
    const String tag = "get_user";
    ModelUser? data;

    final url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
    log('$tag URL : GET: $url');

    try {
      final response = await client.get(url);
      log('$tag response : ${response.body}');

      final decodedResult = json.decode(response.body);
      data = ModelUser.fromJson(decodedResult);
      return data;
    } catch (e) {
      log('$tag error: ${e.toString()}');
      return null;
    }
  }
}
