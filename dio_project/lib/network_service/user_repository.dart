import 'package:dio_project/model/post.dart';
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
    final data = await _httpService
        .getRequest(ApiEndpoint.userEnpoint(UserEndpoint.listUser));
    final listData = data as List;
    _users = listData.map((e) => User.fromJson(e)).toList();
    return _users;
  }

  Future<Post> postPost(Map<String, dynamic> body) async {
    final data = await _httpService.postRequest(
        ApiEndpoint.userEnpoint(UserEndpoint.post), body);
    final _post = Post.fromJson(data);
    return _post;
  }
}
