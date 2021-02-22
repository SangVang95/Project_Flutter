import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) => Container(
          padding: EdgeInsets.all(0),
          child: Text('chat'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Firestore.instance
              .collection('chats/wRi4kBzhO5X0ogETZUGZ/messages')
              .snapshots()
              .listen((data) {
            print(data);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
