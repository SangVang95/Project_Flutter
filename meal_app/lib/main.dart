import 'package:flutter/material.dart';
import 'package:meal_app/categories_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Colors.amber,
        primarySwatch: Colors.pink,
        canvasColor: Color.fromARGB(255, 254, 229, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Rubik",
        textTheme: ThemeData.light().textTheme.copyWith(
          // ignore: deprecated_member_use
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
            // ignore: deprecated_member_use
            body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          // ignore: deprecated_member_use
          title: TextStyle(fontSize: 20, fontFamily: "Rubik", fontWeight: FontWeight.bold)
        )
      ),
      home: CategoriesScreen(),
    );
  }
}


