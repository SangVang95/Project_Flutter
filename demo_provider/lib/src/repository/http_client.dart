
import 'dart:convert';

import 'package:demo_provider/src/model/user.dart';
import 'package:http/http.dart' as http;





class HttpClient {
  static final String url = 'https://jsonplaceholder.typicode.com/users';
  final http.Client client;
  HttpClient({this.client});

  Future<List<User>> getListUser() async {
    final response = await client.get(url);

    final content = response.body;
    if (response.statusCode == 200) {
      return (json.decode(content) as List).map((e) => User.fromJson(e)).toList();
    } else {
      throw Exception('Network err');
    }
  }
}