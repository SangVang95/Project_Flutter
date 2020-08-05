
import 'dart:convert';

import 'package:flutterbloc/simple_list/model/user.dart';
import 'package:http/http.dart' as http;

class Repository {
  static Future<List<User>> getUser() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/users');
    List<User> _list;

    if (response.statusCode == 200) {
      return _list = (json.decode (response.body) as List).map ((user) =>
          User.fromJson (user)).toList ();
    } else {
      throw Exception ('Error');
    }

  }
}

