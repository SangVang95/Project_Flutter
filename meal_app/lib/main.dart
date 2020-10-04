import 'package:flutter/material.dart';
import 'package:meal_app/model/dummy_data.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/category_detail_screen.dart';
import 'package:meal_app/screens/category_meals_screen.dart';
import 'package:meal_app/screens/filters_screens.dart';
import 'package:meal_app/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}





class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }

}


class _MyApp extends State<MyApp> {
  // This widget is the root of your application.

  Map<String, bool> _filters = {
    "gluten": false,
    "lactose": false
  };

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
       if (_filters["gluten"] && !meal.isGlutenFree) {
          return false;
       } else if (_filters["lactose"] && !meal.isLactoseFree) {
         return false;
       } else {
         return true;
       }
      }).toList();
    });
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoritesMeal = [];


  void toggleFavorites(String mealId) {
    final existingIndex = _favoritesMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoritesMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoritesMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id
         == mealId));
      });
    }
  }

  bool _isMealFavorites(String id) {
    return _favoritesMeal.any((meal) => meal.id == id);
  }

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
        "/": (context) => TabsScreen(_favoritesMeal),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(availableMeal: _availableMeals,),
        CategoryDetailScreen.routeName: (context) => CategoryDetailScreen(toggleFavorites, _isMealFavorites),
        FiltersScreen.routeName: (context) => FiltersScreen(currentFilters: _filters,saveFilters: _setFilters,)
      },
      // onGenerateRoute: (settings) {
      //   return MaterialPageRoute(builder: (context) => CategoriesScreen());
      // },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (context) => CategoriesScreen());
      },
    );
  }
}


