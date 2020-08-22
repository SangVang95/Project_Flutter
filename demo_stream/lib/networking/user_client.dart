

import 'dart:convert';
import 'dart:io';

import 'package:demo_stream/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class UserClient {
//  static const String baseUrl = 'https://jsonplaceholder.typicode.com/users';
//
//  final http.Client httpClient;
//  UserClient(this.httpClient);
//
//
//  Future<List<User>> getUser() async {
//
//    final response = await httpClient.get(baseUrl);
//    List<User> _list;
//    if (response.statusCode == 200) {
//      _list = (json.decode(response.body) as List).map( (user) => User.fromJson(user)).toList();
//      return _list;
//    } else {
//      throw Exception("Error");
//    }
//  }

  static Future<List<User>> fetchUser() async {
    final response = await http.get('https://jsonplaceholder.typicode.com/users');
    List<User> _list;
    if (response.statusCode == 200) {
      _list = (json.decode(response.body) as List).map( (user) => User.fromJson(user)).toList();
      return _list;
    } else {
      throw Exception("Error");
    }
  }
}