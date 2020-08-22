import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterbloc/repository/networking_provider.dart';
import 'package:flutterbloc/repository/repositories.dart';
import 'package:flutterbloc/simple_list/list_user_main.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_bloc.dart';
import 'package:flutterbloc/weather/screens/weather_main.dart';
import 'package:http/http.dart' as http;


void main(){

  final Repositories repositories = Repositories(weatherApiClient: WeatherApiClient(httpClient: http.Client()));
  runApp(
      BlocProvider<ThemeBloc>(
        create: (context) => ThemeBloc(),
        child: WeatherPage(repositories: repositories,)),
      );


}
//
//
//
//class Counter extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: BlocProvider<CounterBloc>(
//        create: (context) => CounterBloc(),
//        child: HomePage(),
//      )
//    );
//  }
//}

