import 'dart:async';
import 'package:demo_stream/model/user.dart';
import 'package:demo_stream/networking/user_client.dart';
import 'package:demo_stream/repository/user_repo.dart';
import 'package:demo_stream/screens/user/stream.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserHomeState extends StatefulWidget {

//  final Repository repository;
//  UserHomeState({this.repository});
  @override
  _UserHomeStateState createState() => _UserHomeStateState();
}

class _UserHomeStateState extends State<UserHomeState> {
  MyStream _myStream = MyStream();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _myStream.dispose();

  }

  @override
  Widget build(BuildContext context) {
    print("bul");
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          FlatButton(
            child: Icon(Icons.add),
            onPressed: () {
              print("tap");
              _myStream.getUser();
            },
          )
        ],
        title: Text('User'),
      ),
      body: StreamBuilder(
        stream: _myStream.userStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final list = snapshot.data as List<User>;
            return Container(
              margin:EdgeInsets.all(20) ,
              child:  ListView.builder(
                  itemCount: list.length ,
                  itemBuilder: (BuildContext context, index) {
                    return Text("${list[index].name}", style: TextStyle(fontSize: 30),);
                  }),
            );
          } else if (snapshot.hasError){
            return Center(child: Text(snapshot.error),);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
