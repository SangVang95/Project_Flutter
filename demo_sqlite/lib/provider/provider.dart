

import 'package:demo_sqlite/model/dog.dart';
import 'package:demo_sqlite/repository/database.dart';
import 'package:flutter/material.dart';

class SqliteProvider with ChangeNotifier{

  List<Dog> _list = [];

  List<Dog> get listDog => _list;

  void getListDog() async {
    final list = await DBProvider.db.getAlldog() as List<Dog>;
    _list = list;
    notifyListeners();
  }

  void updateDog(Dog newDog) async {
    await DBProvider.db.updateDog(newDog);
    getListDog();
    notifyListeners();
  }

  void saveDog(Dog newDog) async {
    await DBProvider.db.newDog(newDog);
    getListDog();
    notifyListeners();
  }

  void deleteDog(int id) async {
    await DBProvider.db.deleteDog(id);
    getListDog();
    notifyListeners();
  }

  void deleteAll() async {
    await DBProvider.db.deleteAllDog();
    getListDog();
    notifyListeners();
  }
}