import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:navigator20/routes/route.gr.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pushRoute(const HomeRouter());
          },
          child: const Text('Go to app'),
        ),
      ),
    );
  }
}
