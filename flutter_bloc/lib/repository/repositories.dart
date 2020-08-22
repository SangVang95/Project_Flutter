

import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/model/weather.dart';
import 'package:flutterbloc/repository/networking_provider.dart';

class Repositories {
  final WeatherApiClient weatherApiClient;

  Repositories({this.weatherApiClient});

  Future<Weather> getWeather(String city) async {

    final int locationId = await weatherApiClient.getLocationId(city);

    return weatherApiClient.fetchWeather(locationId);
  }

}