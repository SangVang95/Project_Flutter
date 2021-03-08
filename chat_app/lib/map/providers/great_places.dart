import 'package:chat_app/map/models/place.dart';
import 'package:flutter/material.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _places = [];

  List<Place> get places => _places;
}
