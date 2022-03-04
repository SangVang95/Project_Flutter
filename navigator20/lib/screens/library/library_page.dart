import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/route.gr.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('Library page'),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              context.router.pushNamed('100');
            },
            child: const Text('Go to book detail'),
          )
        ],
      ),
    );
  }
}
