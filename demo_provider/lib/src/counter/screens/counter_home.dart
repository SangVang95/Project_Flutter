

import 'dart:developer';

import 'package:demo_provider/src/counter/provider/my_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CounterHome extends StatefulWidget {
  @override
  _CounterHomeState createState() => _CounterHomeState();
}

class _CounterHomeState extends State<CounterHome> {
  @override
  Widget build(BuildContext context) {
    MyCounter _counter = Provider.of<MyCounter>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Counter'),),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30,),
            Text("${_counter.counter}"),
            Padding(
              padding: EdgeInsets.all(30),
              child: RaisedButton(
                child: Text('Incremment'),
                onPressed: () {
                  _counter.increment();
                },
              ) ,
            )
          ],
        ),
      ),
    );
  }
}
