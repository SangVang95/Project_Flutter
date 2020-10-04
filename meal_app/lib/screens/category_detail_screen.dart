import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/model/dummy_data.dart';
import 'package:meal_app/model/meal.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = "CategoryDetailScreeen";

  final Function toggleFavorites;
  final Function isFavorites;

  CategoryDetailScreen(this.toggleFavorites, this.isFavorites);

  Widget buidSectionTitle(BuildContext context, String text) {
    return Container(
      child: Text(
        text,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);
    return Scaffold(
        appBar: AppBar(
          title: Text(selectedMeal.title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buidSectionTitle(context, "Ingresients"),
              buildContainer(
                ListView.builder(
                    itemCount: selectedMeal.ingredients.length,
                    itemBuilder: (context, index) {
                      return Card(
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(selectedMeal.ingredients[index]),
                          ));
                    }),
              ),
              buidSectionTitle(context, "Steps"),
              buildContainer(ListView.builder(
                  itemCount: selectedMeal.steps.length,
                  itemBuilder: (context, index) => Column(
                        children: [
                          ListTile(
                            title: Text(selectedMeal.steps[index]),
                            leading: CircleAvatar(
                              child: Text("${index + 1}"),
                            ),
                          ),
                          Divider()
                        ],
                      )
                  // return
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(isFavorites(id) ? Icons.star : Icons.star_border),
          onPressed: () => toggleFavorites(id),
        ));
  }
}
