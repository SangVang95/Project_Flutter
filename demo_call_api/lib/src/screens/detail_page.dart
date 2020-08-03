

import 'package:demo_call_api/src/model/user.dart';
import 'package:demo_call_api/src/networking/user_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }

}

class DetailPageState extends State<DetailPage> {
  Future<User> _future;

  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('This is Detail'),),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: 'Input text'
                ),
              ),
            ),
            SizedBox(height: 50,),
            RaisedButton(
              child: Text('Make User'),
              onPressed: () {
                setState(() {
                  _future = UserApi().postUser('${_controller.text}');
                });
              },
            ),
            SizedBox(height: 20,),
            FutureBuilder<User>(
              future: _future,
              builder: (context, snapshot){
                if (snapshot.hasData) {
                  return Text('${snapshot.data.name}');
                } else if (snapshot.hasError){
                  return Text('${snapshot.error}');
                } else {
                  return CircularProgressIndicator();
                }
              },
            )
          ],
        ),
      ),
    );
  }

}