
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:demo_call_api/src/model/user.dart';

class UserApi {

  static Future<List<User>> getUser() async {
    final reponse = await http.get (
        'https://jsonplaceholder.typicode.com/users');

    List<User> _listUser;

    if (reponse.statusCode == 200) {
      // cho list
      return _listUser = (json.decode(reponse.body) as List)
          .map ((i) => User.fromJson (i))
          .toList ();
      //cho object
//    return User.fromJson(json.decode(reponse.body));
    } else {
      throw Exception ('Failure');
    }
  }

  Future<User> postUser(String name) async {
    final response = await http.post("https://jsonplaceholder.typicode.com/posts", headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    }, body: jsonEncode(<String, String>{
      'name': name
    }));

    if (response.statusCode == 201) {
      return User.fromJson(json.decode(response.body));
    } else {
      throw Exception('Post method Failes');
    }

  }




}



