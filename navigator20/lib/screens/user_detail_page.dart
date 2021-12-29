import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('detail'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('user detail'),
          ),
          TextButton(
              onPressed: () {
                context.router.popUntilRoot();
              },
              child: Text('pop root view'))
        ],
      ),
    );
  }
}
