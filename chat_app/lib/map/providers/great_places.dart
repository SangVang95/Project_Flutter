import 'dart:io';

import 'package:chat_app/map/database/db_helper.dart';
import 'package:chat_app/map/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places => _places;

  void addPlace(String title, File image) {
    final newPlace = Place(
        id: DateTime.now().toString(),
        title: title,
        location: null,
        image: image);
    _places.add(newPlace);
    notifyListeners();
    DBHelper.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path
    });
  }

  Future<void> fetchPlaces() async {
    final data = await DBHelper.get('places');
    _places = data
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image'])))
        .toList();
    notifyListeners();
  }
}
