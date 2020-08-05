


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterbloc/infinite_list/model/comment.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({Key key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        '${comment.id}',
        style: TextStyle(fontSize: 10.0),
      ),
      title: Text(comment.name),
      isThreeLine: true,
      subtitle: Text(comment.id.toString()),
      dense: true,
    );
  }
}