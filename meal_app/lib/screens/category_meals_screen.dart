import 'package:flutter/material.dart';
import 'package:meal_app/model/dummy_data.dart';
import 'package:meal_app/model/meal.dart';

import '../widgets/meal_item.dart';


class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> availableMeal;
  CategoryMealsScreen({this.availableMeal});
  @override
  State<StatefulWidget> createState() {
    return _CategoryMealsScreen();
  }
}




class _CategoryMealsScreen extends State<CategoryMealsScreen> {

  String categoryTitle;
  List<Meal> displayMeal;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {

    if (!_loadedInitData) {
      final routeArgs =
      ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayMeal = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      displayMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayMeal[index].id,
            title: displayMeal[index].title,
            imgUrl: displayMeal[index].imageUrl,
            duration: displayMeal[index].duration,
            affordability: displayMeal[index].affordability,
            complexity: displayMeal[index].complexity,
          );
        },
        itemCount: displayMeal.length,
      ),
    );
  }
}
