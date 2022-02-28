import 'package:dio/dio.dart';
import 'package:domain/domain.dart';

class Service {
  Dio dio = Dio();

  Future<List<User>> getUser() async {
    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/users');
    final list = response.data as List;
    final users = list.map((e) => User.fromJson(e)).toList();
    return users;
  }
}
