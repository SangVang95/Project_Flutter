

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class WeatherRequestEvent extends WeatherEvent {
  final String city;
  WeatherRequestEvent({@required this.city}) : assert(city != null);

  @override
  // TODO: implement props
  List<Object> get props => [city];
}


class WeatherRefreshEvent extends WeatherEvent {
  final String city;

  WeatherRefreshEvent({@required this.city});

  @override
  // TODO: implement props
  List<Object> get props => [city];
}