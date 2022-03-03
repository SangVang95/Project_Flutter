import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User')),
      body: Center(
        child: TextButton(
          child: const Text('Log out'),
          onPressed: () {
            context.router.popUntilRoot();
          },
        ),
      ),
    );
  }
}
