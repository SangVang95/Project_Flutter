
import 'package:demo_provider/src/model/user.dart';
import 'package:demo_provider/src/repository/http_client.dart';
import 'package:demo_provider/src/repository/repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SimpleListProvider with ChangeNotifier {
  final Repositories repositories = Repositories(httpClient: HttpClient(client: http.Client()));

  List<User> _list = [];

  List<User> get listUser => _list;



  void fetchUser() async {
    _list = await repositories.fetchListUser();
    notifyListeners();
  }

}