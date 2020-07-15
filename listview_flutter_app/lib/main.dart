
import 'package:flutter/material.dart';
import 'package:listview_flutter_app/ListViewExample.dart';

void main() => runApp(MyApp());



class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final materrialApp = MaterialApp(
      title: '',
      home: ListViewExample(),
    );
    return materrialApp;

  }

}




