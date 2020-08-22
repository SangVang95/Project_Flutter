

import 'package:flutter/material.dart';

class CitySelection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CitySelectionState();
  }
}

class CitySelectionState extends State<CitySelection> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('City'),),
      body: Form(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: TextFormField(
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      labelText: 'City',
                      hintText: 'Chicago'
                  ),
                ),
              ),),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pop(context, _textEditingController.text);
              },
            )
          ],
        ),
      ) ,
    );
  }
}
