


import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_bloc.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_event.dart';
import 'package:flutterbloc/weather/bloc/weather_bloc.dart';
import 'package:flutterbloc/weather/bloc/weather_event.dart';
import 'package:flutterbloc/weather/bloc/weather_state.dart';
import 'package:flutterbloc/weather/screens/weather_city_selection.dart';
import 'package:flutterbloc/weather/widget/combine_temp.dart';
import 'package:flutterbloc/weather/widget/last_update.dart';
import 'package:flutterbloc/weather/widget/location.dart';





class WeatherHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WeatherHomeState();
  }
}

class WeatherHomeState extends State<WeatherHome> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshCompleter = Completer<Void>();
  }

  @override
  Widget build(BuildContext context) {
    final WeatherBloc _weatherBloc = BlocProvider.of<WeatherBloc>(context);
    final ThemeBloc _themBloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Weather'),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.search), onPressed: () async {
          final city = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>
          CitySelection() ));
          if(city != null){
            _weatherBloc.add(WeatherRequestEvent(city: city));
          }
        })
      ],),
      body: SafeArea(
        child: Center(
          child: BlocConsumer<WeatherBloc, WeatherState>(
            listener: (context, state) {
              if (state is  WeatherSuccess) {
                _themBloc.add(WeatherChange(condition: state.weather.condition));
                _refreshCompleter.complete();
                _refreshCompleter = Completer();
              }
            },
            builder: (context, state) {
              if (state is WeatherInitial) {
                return Center(child: Text('Plese, Selection a city'),);
              } else if (state is WeatherLoading) {
                return Center(child: CircularProgressIndicator(),);
              } else if (state is WeatherSuccess) {
                return RefreshIndicator(
                  onRefresh: () {
                    _weatherBloc.add(WeatherRefreshEvent(city: state.weather.location));
                    return _refreshCompleter.future;
                  },
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 100.0),
                        child: Center(
                          child: Location(location: state.weather.location),
                        ),
                      ),
                      Center(
                        child: LastUpdated(dateTime: state.weather.lastUpdated),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 50.0),
                        child: Center(
                          child: CombinedWeatherTemperature(
                            weather: state.weather,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is WeatherFailure) {
                return Center(child: Text('${state.msg}'),);
              } else {
                return Container();
              }
            },
          ),),
      ),
    );
  }

}
