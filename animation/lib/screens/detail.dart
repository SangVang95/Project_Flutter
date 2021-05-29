import 'package:animation/models/trip.dart';
import 'package:animation/screens/home.dart';
import 'package:animation/widgets/favourite.dart';
import 'package:animation/widgets/screen_title.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Trip trip;

  DetailPage(this.trip);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ScreenTitle(trip.title),
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Hero(
              tag: trip.id,
              child: Image.asset(
                trip.urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Favourite()
        ],
      ),
    );
  }
}
