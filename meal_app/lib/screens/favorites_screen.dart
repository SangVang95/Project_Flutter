import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';


class FavoritesScreens extends StatelessWidget {

  final List<Meal> favoritesMeal;

  FavoritesScreens(this.favoritesMeal);

  @override
  Widget build(BuildContext context) {
    if (favoritesMeal.isEmpty) {
      return Scaffold(
        body: Center(
          child:
          Text("Favorites"),),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favoritesMeal[index].id,
            title: favoritesMeal[index].title,
            imgUrl: favoritesMeal[index].imageUrl,
            duration: favoritesMeal[index].duration,
            affordability: favoritesMeal[index].affordability,
            complexity: favoritesMeal[index].complexity,
          );
        },
        itemCount: favoritesMeal.length,
      );
    }


  }
}