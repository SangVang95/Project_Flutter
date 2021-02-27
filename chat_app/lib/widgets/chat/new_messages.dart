import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NewMessages extends StatefulWidget {
  @override
  _NewMessagesState createState() => _NewMessagesState();
}

class _NewMessagesState extends State<NewMessages> {
  final _textController = TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    final userId = await FirebaseAuth.instance.currentUser.uid;
    final username =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _textController.text,
      'createAt': Timestamp.now(),
      'userId': userId,
      'username': username['username']
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
                child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Send a messages...',
              ),
              onChanged: (value) {
                setState(() {});
              },
            )),
            IconButton(
              color: Theme.of(context).primaryColor,
              icon: Icon(Icons.send),
              onPressed:
                  _textController.text.trim().isEmpty ? null : _sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
