import 'dart:convert';

import 'package:dio_project/network_service/api_endpoint.dart';
import 'package:dio_project/network_service/http_service.dart';
import '../model/user.dart';

class UserRepository {
  HttpService _httpService;
  UserRepository() {
    _httpService = HttpService();
  }

  Future<List<User>> getUsers() async {
    List<User> _users = [];
    final response = await _httpService
        .getRequest(ApiEndpoint.userEnpoint(UserEndpoint.listUser));

    print("------------------");
    final String data = response.data;

    List responseJson = json.decode(data);

    // print(responseJson.map((e) => print(User.fromJson(e))));

    _users = responseJson.map((e) => User.fromJson(e)).toList();

    return _users;
  }
}
