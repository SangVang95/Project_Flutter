import 'package:flutter/material.dart';

class MessageBuble extends StatelessWidget {
  final String message;
  final String username;
  final bool isMe;
  final Key key;
  MessageBuble({this.username, this.message, this.isMe, this.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
            width: 140,
            decoration: BoxDecoration(
                color: isMe ? Colors.grey[300] : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                    bottomLeft:
                        !isMe ? Radius.circular(0) : Radius.circular(12),
                    bottomRight:
                        isMe ? Radius.circular(0) : Radius.circular(12))),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: Column(
              children: [
                // FutureBuilder(
                //     future: FirebaseFirestore.instance
                //         .collection('users')
                //         .doc(userId)
                //         .get(),
                //     builder: (ctx, snapshot) {
                //       if (snapshot.connectionState == ConnectionState.waiting) {
                //         return Text('Loading');
                //       }
                //       final _userName = snapshot.data['username'];
                //       return Text(_userName);
                //     }),
                Text(
                  username,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe
                          ? Colors.black
                          : Theme.of(context).accentTextTheme.headline6.color),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: isMe
                        ? Colors.black
                        : Theme.of(context).accentTextTheme.headline6.color,
                  ),
                ),
              ],
            )),
      ],
    );
  }
}
