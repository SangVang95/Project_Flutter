import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/screens/filters_screens.dart';



class MainDrawer extends StatelessWidget {

  Widget _buildLisTitle(String title, IconData icons, Function completion) {
    return ListTile(
      leading: Icon(icons, size: 26,),
      title: Text(title, style: TextStyle(
        fontFamily: "Rubik",
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),),
      onTap: completion,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text("Cooking", style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            ),),
          ),
          SizedBox(height: 20,),
          _buildLisTitle("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed("/");
          }),
          _buildLisTitle("Filters", Icons.filter, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          })
        ],
      ),
    );
  }
}
