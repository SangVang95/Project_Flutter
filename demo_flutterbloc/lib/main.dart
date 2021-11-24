import 'package:demo_flutterbloc/demo/bloc/counter_bloc.dart';
import 'package:demo_flutterbloc/demo/screens/counter_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterHome(),
      ),
    );
  }
}
