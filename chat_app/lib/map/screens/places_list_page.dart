import 'package:chat_app/map/providers/great_places.dart';
import 'package:chat_app/map/screens/add_place_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatefulWidget {
  @override
  _PlacesListState createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  @override
  void initState() {
    // context.read<GreatPlaces>().fetchPlaces();
    super.initState();
  }

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
      body: Consumer<GreatPlaces>(
          child: Center(child: Text('Got no places yet')),
          builder: (context, snapshot, child) => snapshot.places.length <= 0
              ? child
              : ListView.builder(
                  itemCount: snapshot.places.length,
                  itemBuilder: (context, index) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              FileImage(snapshot.places[index].image),
                        ),
                        title: Text(snapshot.places[index].title),
                        onTap: () {},
                      ))),
    );
  }
}
