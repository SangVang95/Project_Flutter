

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/model/weather.dart';

abstract class WeatherState extends Equatable {
  WeatherState();
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherInitial extends WeatherState {}
class WeatherLoading extends WeatherState {}
class WeatherSuccess extends WeatherState {
  final Weather weather;
  WeatherSuccess({@required this.weather}) : assert( weather != null);

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}

class WeatherFailure extends WeatherState {
  final String msg;
  WeatherFailure({@required this.msg});

  @override
  // TODO: implement props
  List<Object> get props => [msg];
}
