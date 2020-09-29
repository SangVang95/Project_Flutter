

import 'package:flutter/material.dart';
import 'package:meal_app/catefories_item.dart';
import 'package:meal_app/dummy_data.dart';


class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Meal"),),
      body: GridView(
        padding: const EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((e) => CategoriesItem(title: e.title, color: e.color)).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),
      ),
    );
  }
}
