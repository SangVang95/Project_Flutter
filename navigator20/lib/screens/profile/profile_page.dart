import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/route.gr.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Profile page'),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              context.pushRoute(const UserRoute());
            },
            child: const Text('Go to user'),
          )
        ],
      ),
    );
  }
}
