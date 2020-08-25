

import 'package:demo_sqlite/model/dog.dart';
import 'package:flutter/material.dart';

class Alert {
  static showAlertOneTextField(context,
      Function(Dog) _callback,
      ) async {

    final Dog newDog = Dog();

    final TextEditingController _idController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _ageController = TextEditingController();



    await showDialog<String>(
      context: context,
      child: AlertDialog(
        content: Container(
          child: Column(
            children: [
              TextField(
                controller: _idController,
                autofocus: true,
                decoration: InputDecoration(
                    hintText: 'New ID',
                    labelText: 'ID'
                ),
              ),
              TextField(
                controller: _nameController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: 'New Name',
                    labelText: 'Name'
                ),
              ),
              TextField(
                controller: _ageController,
                autofocus: false,
                decoration: InputDecoration(
                    hintText: 'New Age',
                    labelText: 'AGE'
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('OK'),
            onPressed: () {
              newDog.id = int.parse(_idController.text.trim());
              newDog.name = _nameController.text.trim();
              newDog.age = int.parse(_ageController.text.trim());
              _callback(newDog);
            },
          ),
          FlatButton(
            child: Text('Cancle'),
            onPressed: () {
              FocusScope.of(context).requestFocus(FocusNode());
              Navigator.pop(context);
            },
          )
        ],
      ) ,
    );
  }
}