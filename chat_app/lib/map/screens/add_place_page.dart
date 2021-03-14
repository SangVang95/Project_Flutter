import 'dart:io';
import 'package:chat_app/map/providers/great_places.dart';
import 'package:chat_app/map/widgets/image_input.dart';
import 'package:chat_app/map/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddPlacePage extends StatefulWidget {
  static const route = '/AddPlacePage';
  @override
  _AddPlacePageState createState() => _AddPlacePageState();
}

class _AddPlacePageState extends State<AddPlacePage> {
  final _titleController = TextEditingController();

  File _pickedImage;

  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage == null) {
      return;
    }
    context.read<GreatPlaces>().addPlace(_titleController.text, _pickedImage);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a new place'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Title',
                      ),
                      controller: _titleController,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ImageInput(
                      onSelectimage: _selectImage,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    LocationInput()
                  ],
                ),
              ),
            )),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text('Add place'),
            )
          ],
        ));
  }
}
