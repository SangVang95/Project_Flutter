import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/model/weather.dart';
import 'package:http/http.dart' as http;




class WeatherApiClient {
  static const baseUrl = 'https://www.metaweather.com';
  final http.Client httpClient;

  WeatherApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<int> getLocationId(String city) async {
    final locationUrl = '$baseUrl/api/location/search/?query=$city';
    final locationResponse = await this.httpClient.get(locationUrl);
    if (locationResponse.statusCode == 200) {
      final locationJson = json.decode(locationResponse.body) as List;
      return locationJson.first['woeid'];
    } else {
      throw Exception('error getting locationId for city');
    }
  }

  Future<Weather> fetchWeather(int locationId) async {
    final weatherUrl = '$baseUrl/api/location/$locationId';
    final weatherResponse = await this.httpClient.get(weatherUrl);

    if (weatherResponse.statusCode == 200) {
      final weatherJson = json.decode(weatherResponse.body);
      return Weather.fromJson(weatherJson);
    } else {
      throw Exception('error getting weather for location');
    }
  }

}