
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert {

//  Function(String) _callback;

  static showAlertOneTextField(context, Function(String) _callback) async {


    final TextEditingController _controller = TextEditingController();

    await showDialog<String>(
        context: context,
        child: AlertDialog(
          content: Container(
            child: TextField(
              controller: _controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: 'New name',
                labelText: 'Update'
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                _callback(_controller.text);
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
