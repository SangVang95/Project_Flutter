import 'package:dio_project/model/user.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../network_service/user_repository.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<User> _users = [];
  UserRepository _repository;

  Future getUser() async {
    final users = await _repository.getUsers();
    setState(() {
      _users = users;
    });
  }

  @override
  void initState() {
    _repository = UserRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () => getUser())
        ],
      ),
      body: Center(
        child: _users.isEmpty
            ? CircularProgressIndicator()
            : Text(_users[0].phone),
      ),
    );
  }
}
