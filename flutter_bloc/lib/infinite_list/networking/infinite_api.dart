
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutterbloc/infinite_list/model/comment.dart';

class CommentAPI {

  static Future<List<Comment>> getUser(int start, int limit) async {
    List<Comment> _list;

    final response = await http.get (
        'https://jsonplaceholder.typicode.com/comments?_start=$start&_limit=$limit');

    if (response.statusCode == 200) {
      return _list = (json.decode (response.body) as List).map ((i) =>
          Comment.fromJson (i)).toList ();
    } else {
      throw Exception ('Get Comment failed');
    }
  }
}