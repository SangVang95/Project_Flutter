




import 'dart:async';

import 'package:demo_stream/model/user.dart';
import 'package:demo_stream/networking/user_client.dart';

class MyStream {

  List<User> list = [];
  StreamController _controller = StreamController<List<User>>();

  Stream get userStream => _controller.stream;

  void getUser() async {
    await UserClient.fetchUser().then( (value) {
      value.map((user) {
        list.add(user);
      });
    });
    _controller.sink.add(list);
  }

  void dispose() {
    _controller.close();
  }
}