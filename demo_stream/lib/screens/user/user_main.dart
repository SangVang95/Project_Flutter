

import 'package:demo_stream/networking/user_client.dart';
import 'package:demo_stream/repository/user_repo.dart';
import 'package:demo_stream/screens/user/user_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserPage extends StatelessWidget {
//  final Repository repository;
//  UserPage({this.repository});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserHomeState(),
    );
  }
}
