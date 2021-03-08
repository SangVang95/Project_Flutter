import 'package:flutter/material.dart';

class AddPlacePage extends StatefulWidget {
  static const route = '/AddPlacePage';
  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a new place'),
        ),
        body: Column(
          children: [
            Text('User input...'),
            ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text('Add place'))
          ],
        ));
  }
}
