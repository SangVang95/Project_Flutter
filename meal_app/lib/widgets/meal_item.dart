import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/category_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imgUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem(
      {this.title,
      this.affordability,
      this.complexity,
      this.duration,
      this.imgUrl,
      this.id,
      });

  String get complexityText {
    if (complexity == Complexity.Simple) {
      return "Simple";
    } else if (complexity == Complexity.Challenging) {
      return "Challenging";
    } else {
      return "Hard";
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
        default: break;
    }
  }

  void seletecMeal(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryDetailScreen.routeName, arguments: id,).then((mealId) => {
      if (mealId != null) {
        // removeItem(mealId)
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => seletecMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(imgUrl,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.black45,
                      width: 300,
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 23, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
                padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    Icon(Icons.schedule),
                    SizedBox(width: 6,),
                    Text("$duration min"),
                  ],),
                  Row(children: [
                    Icon(Icons.work),
                    SizedBox(width: 6,),
                    Text("$complexityText "),
                  ],),
                  Row(children: [
                    Icon(Icons.attach_money),
                    SizedBox(width: 6,),
                    Text("$affordabilityText "),
                  ],)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
