import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/infinite_list/infinite_main.dart';
import 'package:flutterbloc/simple_list/list_user_main.dart';

import 'counter/Screen/home_page.dart';
import 'counter/bloc/counter_bloc.dart';


void main() => runApp(ListUserHome());
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

