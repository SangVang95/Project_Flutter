import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/model/weather.dart';

abstract class ThemeEvent extends Equatable {
  ThemeEvent();
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherChange extends ThemeEvent {
  final WeatherCondition condition;
  WeatherChange({@required this.condition});


  @override
  // TODO: implement props
  List<Object> get props => [condition];
}

