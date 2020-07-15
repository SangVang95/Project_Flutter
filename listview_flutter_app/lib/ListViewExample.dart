import 'data.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListViewExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ListViewExampleState();
    throw UnimplementedError();
  }

}

class ListViewExampleState extends State<ListViewExample>{
  List<Container> _itemsFlower() {
    int index = 0;
    return flowers.map((flower){
      var container = Container(
        decoration: index % 2 ==  0?
        BoxDecoration(
          color: Colors.amber
        ): BoxDecoration(color: Colors.pink),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 70.0,
                width: 70.0,
                imageUrl: flower.imageURL,
              ),
            )
          ],
        ),
      );
      index = index+1;
      return container;
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: _itemsFlower(),
    );
    throw UnimplementedError();
  }
}