import 'package:chat_app/map/screens/add_place_page.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AddPlacePage.route);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
