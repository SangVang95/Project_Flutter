import 'package:chat_app/widgets/chat/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  Future<User> getUser() async {
    final user = await FirebaseAuth.instance.currentUser;
    return Future<User>.value(user);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getUser(),
        builder: (ctx, snapshotFuture) {
          if (snapshotFuture.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('chat')
                .orderBy('createAt')
                .snapshots(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              final List<DocumentSnapshot> _docs = snapshot.data.docs;
              final _user = snapshotFuture.data as User;
              return ListView.builder(
                  itemCount: _docs.length,
                  itemBuilder: (ctx, index) => MessageBuble(
                        message: _docs[index]['text'],
                        isMe: _docs[index]['userId'] == _user.uid,
                        key: ValueKey(_docs[index].id),
                      ));
            },
          );
        });
  }
}
