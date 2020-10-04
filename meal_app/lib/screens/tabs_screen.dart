import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/model/meal.dart';
import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  final List<Meal> _favoritesMeal;
  TabsScreen(this._favoritesMeal);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  void _selectePage(int index) {
     setState(() {
       _selectedPageIndex = index;
     });
  }

  @override
  void initState() {
    _pages = [
      {"page": CategoriesScreen(), "title": "Categories"},
      {"page": FavoritesScreens(widget._favoritesMeal), "title": "Favorites"}
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectePage,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category), title: Text("Categories")),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star), title: Text("Favourites")),
        ],
      ),
    );
  }
}
