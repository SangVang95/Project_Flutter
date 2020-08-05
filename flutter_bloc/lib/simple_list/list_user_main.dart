

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_bloc.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_event.dart';
import 'package:flutterbloc/simple_list/screens/list_user.dart';

class ListUserHome extends StatelessWidget {
 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ListUserBloc()..add(EventGetUser()),
        child: ListUser() ,
      ),
    );
  }
}
