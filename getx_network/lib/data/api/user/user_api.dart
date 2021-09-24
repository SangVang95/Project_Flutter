// ignore_for_file: avoid_print

import 'package:getx_network/data/api/user/user_endpoint.dart';
import 'package:getx_network/data/api/user/user_param.dart';
import 'package:getx_network/data/model/response/response.dart' as model;
import 'package:getx_network/data/model/user.dart';
import 'package:getx_network/data/services/network/services.dart';

// Parse json
class UserAPI {
  final DioService _dioService;

  UserAPI(this._dioService);

  Future<List<User>> getAllUser() async {
    model.Response response =
        await _dioService.request(UserEndpoint.getAllUser());
    print(response.data);
    var list = response.data as List;
    var users = list.map((e) => User.fromJson(e)).toList();
    return users;
  }

  Future<User> createUser(UserParams params) async {
    model.Response _response =
        await _dioService.request(UserEndpoint.createUser(params));
    print(_response.data);
    final user = User.fromJson(_response.data);
    return user;
  }
}
