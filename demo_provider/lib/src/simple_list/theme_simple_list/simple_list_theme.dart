

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleListTheme with ChangeNotifier {
  Color color;

  Void onChangeColor({bool isChangColor}) {
    if (isChangColor) {
      color = Colors.red;
    } else {
      color = Colors.cyan;
    }
    notifyListeners();
  }

}