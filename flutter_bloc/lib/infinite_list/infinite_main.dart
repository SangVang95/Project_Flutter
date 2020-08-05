import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_bloc.dart';
import 'package:flutterbloc/infinite_list/bloc/infinite_event.dart';
import 'package:flutterbloc/infinite_list/screens/infinite_list_home.dart';

class InfiniteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      home: BlocProvider (
        create: (context) =>
        InfiniteBloc ()
          ..add(GetComment()),
        child: InfiniteListHome (),
      ),
    );
  }
}