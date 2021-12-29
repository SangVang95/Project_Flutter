import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/router.gr.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: TextButton(
            onPressed: () {
              // context.router.replace(SecondRoute(name: 'Dav'));
              context.router.push(UserDetailRoute());
            },
            child: Text('go to user detail')),
      ),
    );
  }
}
