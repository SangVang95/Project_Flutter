
import 'package:demo_provider/src/counter/provider/my_counter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_home.dart';

class CounterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<MyCounter>(
        create: (context) => MyCounter(),
        child: CounterHome(),
      ),
    );
  }
}
