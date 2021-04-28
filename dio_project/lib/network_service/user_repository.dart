import 'package:dio_project/model/post.dart';
import 'package:dio_project/network_service/api_endpoint.dart';
import 'package:dio_project/network_service/http_service.dart';
import 'package:flutter/foundation.dart';
import '../model/user.dart';

class UserRepository {
  HttpService _httpService;
  UserRepository() {
    _httpService = HttpService();
  }

  Future<List<User>> getUsers() async {
    List<User> _users = [];
    final data = await _httpService
        .getRequest(ApiEndpoint.userEnpoint(UserEndpoint.listUser));
    final listData = data as List;
    _users = listData.map((e) => User.fromJson(e)).toList();
    // await deserialize<List<User>>(data as List).then((value) => _users);
    // _users = deserialize(data as List);
    // return list;
    return _users;
  }

  Future<Post> postPost(Map<String, dynamic> body) async {
    final data = await _httpService.postRequest(
        ApiEndpoint.userEnpoint(UserEndpoint.post), body);
    // final _post = deserialize<Post>(data);
    final _post = Post.fromJson(data);
    return _post;
  }
}

T parseJson<T>(dynamic jsonBody) {
  if (jsonBody is List) {
    final _user = jsonBody.map((e) => User.fromJson(e)).toList();
    // print(_user.map((e) => print(e.name)));
    return _user as T;
  } else {
    return Post.fromJson(jsonBody) as T;
  }
}

class DeserializeAction<T> {
  final dynamic json;

  DeserializeAction(this.json);

  T invoke() {
    return parseJson<T>(json);
  }

  static dynamic _invoke(DeserializeAction a) => a.invoke();
}

T deserialize<T>(dynamic json) {
  return compute(DeserializeAction._invoke, DeserializeAction<T>(json)) as T;
}
