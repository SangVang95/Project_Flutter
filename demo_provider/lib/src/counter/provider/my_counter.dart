

import 'package:flutter/cupertino.dart';

class MyCounter with ChangeNotifier {
  var _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }
}