

import 'dart:async';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/weather/bloc/weather_bloc.dart';
import 'package:flutterbloc/weather/bloc/weather_event.dart';
//
//class WeatherRefresh extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return WeatherRefreshState();
//  }
//
//}
//
//class WeatherRefreshState extends State<WeatherRefresh> {
//  Completer<void> _completer;
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    super.initState();
//    _completer = Completer<Void>();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final WeatherBloc weatherBloc = BlocProvider.of<WeatherBloc>(context);
//    return RefreshIndicator(
//      onRefresh: () {
//        weatherBloc.add(WeatherRefreshEvent(city:  ));
//      },
//    );
//  }
//
//}