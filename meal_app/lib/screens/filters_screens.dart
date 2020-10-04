import 'package:flutter/material.dart';
import 'package:meal_app/widgets/main_drawer.dart';



class FiltersScreen extends StatefulWidget {
  static const routeName = "Filtter Screens";
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen({this.currentFilters, this.saveFilters});

  @override
  State<StatefulWidget> createState() {
    return _FiltersScreen();
  }
}



class _FiltersScreen extends State<FiltersScreen> {

  bool _glutenFree = false;
  bool _lactoseFree = false;

  Widget _buildSwitchAction(String title, bool value, Function completion) {
    return SwitchListTile(
        activeColor: Theme.of(context).primaryColor,
        title: Text(title),
        value: value,
        onChanged: completion,
    );
  }

  @override
  void initState() {
    _glutenFree = widget.currentFilters["gluten"];
    _lactoseFree = widget.currentFilters["lactose"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilter = {
                  "gluten": _glutenFree,
                  "lactose": _lactoseFree
                };
                widget.saveFilters(selectedFilter);
              })
        ],
        title: Text("Your filters"),),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text("Adjust your meal", style: Theme.of(context).textTheme.title,),
          ),
          Expanded(child:
            ListView(children: [
              _buildSwitchAction("Gluten Free", _glutenFree, (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              _buildSwitchAction("Lactose Free", _lactoseFree, (newValue) {
                setState(() {
                  _lactoseFree = newValue;
                });
              })
          ],))
        ],
      ),
    );
  }
}




