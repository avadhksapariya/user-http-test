import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:user_http_test/model_user.dart';

class RESTUser {
  Future<ModelUser?> getUser() async {
    const String tag = "get_user";
    ModelUser? data;

    final url = Uri.parse('https://jsonplaceholder.typicode.com/users/1');
    log('$tag URL : GET: $url');

    try {
      final response = await http.get(url);
      log('$tag response : ${response.body}');

      if (response.statusCode == 200) {
        final decodedResult = json.decode(response.body);
        data = ModelUser.fromJson(decodedResult);
        return data;
      }
      throw Exception('Unable to get response with statusCode ${response.statusCode}');
    } catch (e) {
      log('$tag error: ${e.toString()}');
      return null;
    }
  }
}
