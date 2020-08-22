
import 'package:demo_provider/src/model/user.dart';
import 'package:demo_provider/src/repository/http_client.dart';


class Repositories {
  final HttpClient httpClient;

  Repositories({this.httpClient});

  Future<List<User>> fetchListUser() async {
    return httpClient.getListUser();
  }

}
