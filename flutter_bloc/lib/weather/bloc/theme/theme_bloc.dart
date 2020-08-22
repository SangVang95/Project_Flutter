

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/model/weather.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_event.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  @override
  // TODO: implement initialState
  ThemeState get initialState => ThemeState(color: Colors.lightBlue, theme: ThemeData.light());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event)  async* {
    if (event is WeatherChange) {
      yield* _mapConditionThemeState(event);
    }
  }

  Stream<ThemeState> _mapConditionThemeState(WeatherChange event) async* {
    final condition = event.condition;



    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        yield ThemeState(
          theme: ThemeData(
            primaryColor: Colors.orangeAccent,
          ),
          color: Colors.yellow,
        );
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        yield ThemeState(
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
          ),
          color: Colors.lightBlue,
        );
        break;
      case WeatherCondition.heavyCloud:
        yield ThemeState(
          theme: ThemeData(
            primaryColor: Colors.blueGrey,
          ),
          color: Colors.grey,
        );
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        yield ThemeState(
          theme: ThemeData(
            primaryColor: Colors.indigoAccent,
          ),
          color: Colors.indigo,
        );
        break;
      case WeatherCondition.thunderstorm:
        yield ThemeState(
          theme: ThemeData(
            primaryColor: Colors.deepPurpleAccent,
          ),
          color: Colors.deepPurple,
        );
        break;
      case WeatherCondition.unknown:
        yield ThemeState(
          theme: ThemeData.light(),
          color: Colors.lightBlue,
        );
        break;
    }
  }
}