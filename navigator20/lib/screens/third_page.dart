import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            const Text('Third page'),
            IconButton(
                onPressed: () {
                  context.router.pop('Name');
                },
                icon: const Icon(Icons.arrow_back_ios))
          ],
        ),
      ),
    );
  }
}
