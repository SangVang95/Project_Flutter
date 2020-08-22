

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/repository/repositories.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_bloc.dart';
import 'package:flutterbloc/weather/bloc/theme/theme_state.dart';
import 'package:flutterbloc/weather/bloc/weather_bloc.dart';
import 'package:flutterbloc/weather/screens/weather_home.dart';

class WeatherPage extends StatelessWidget {
  final Repositories repositories;
  const WeatherPage({Key key,@required this.repositories}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Weather',
          theme: state.theme,
          home: BlocProvider(
            create: (context) => WeatherBloc(repositories: repositories),
            child: WeatherHome(),
          ),
        );
      },
    );
  }

}