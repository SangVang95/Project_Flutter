import 'package:flutter/material.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_detail_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';

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
        accentColor: Colors.amber[100],
        primarySwatch: Colors.pink,
        canvasColor: Color.fromARGB(255, 254, 229, 600),
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
      // home: CategoriesScreen(),
      routes: {
        "/": (context) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(),
        CategoryDetailScreen.routeName: (context) => CategoryDetailScreen()
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },


    );
  }
}


