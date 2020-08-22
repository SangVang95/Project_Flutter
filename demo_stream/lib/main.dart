import 'dart:async';

import 'package:demo_stream/networking/user_client.dart';
import 'package:demo_stream/repository/user_repo.dart';
import 'package:demo_stream/screens/counter/counter_main.dart';
import 'package:demo_stream/screens/user/user_main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
//  final Repository repository = Repository(userClient: UserClient(http.Client()));
  runApp(UserPage());
}


