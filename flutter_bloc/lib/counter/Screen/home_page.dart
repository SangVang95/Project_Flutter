

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/counter/bloc/counter_bloc.dart';
import 'package:flutterbloc/counter/bloc/counter_event.dart';
import 'package:flutterbloc/counter/bloc/counter_state.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc _counterBloc = context.bloc<CounterBloc>();

    return Scaffold(
      appBar: AppBar(title: Text("Demo Counter Bloc"),),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          return Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
                child: Text("${state.number}", style: TextStyle(fontSize: 40),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Increment"),
                    onPressed: () {
                      _counterBloc.add(IncrementEvent());
                    },
                  ),
                  SizedBox(width: 20,),
                  RaisedButton(
                    child: Text("Decrement"),
                    onPressed: () {
                      _counterBloc.add(DecrementEvent());
                    },
                  )
                ],
              )
            ],
          );
        },
      ),
    );
  }
}