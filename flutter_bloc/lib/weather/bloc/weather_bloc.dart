

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/model/weather.dart';
import 'package:flutterbloc/repository/repositories.dart';
import 'package:flutterbloc/weather/bloc/weather_event.dart';
import 'package:flutterbloc/weather/bloc/weather_state.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final Repositories repositories;

  WeatherBloc({@required this.repositories}) : assert( repositories != null);
  @override
  // TODO: implement initialState
  WeatherState get initialState => WeatherInitial();

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    final currentState = state;
    if (event is WeatherRequestEvent) {
        yield WeatherLoading();
        try {

          final Weather weather = await repositories.getWeather(event.city);
          yield WeatherSuccess(weather: weather);
        } catch (msg) {
          yield WeatherFailure(msg: msg);
        }
    } else if (event is WeatherRefreshEvent) {
      yield* _mapPullToRefresh(event);
    }
  }

  Stream<WeatherState> _mapPullToRefresh(WeatherRefreshEvent event) async* {
    yield WeatherLoading();
    try {
      final Weather weather = await repositories.getWeather(event.city);
      yield WeatherSuccess(weather: weather);
    }catch (err) {
      yield WeatherFailure(msg: err);
    }
  }

}

