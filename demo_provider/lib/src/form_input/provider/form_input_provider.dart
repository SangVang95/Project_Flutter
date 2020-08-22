

import 'package:flutter/material.dart';

class FormInputProvider with ChangeNotifier {
  String _validMessage = '';
  bool _isValid;

  String get validMessage => _validMessage;
  bool get isValid => _isValid;

  void checkValidate({String ten}) {
    if (ten == "name") {
      licenceValid();
    } else {
      licenceInValid();
    }
  }

  void licenceValid() {
    _validMessage = 'Cho phep lai xe';
    _isValid = true;
    notifyListeners();
  }

  void licenceInValid() {
    _validMessage = 'K cho phep lai xe';
    _isValid = false;
    notifyListeners();
  }
}