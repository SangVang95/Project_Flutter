import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:navigator20/routes/route.gr.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({Key? key, @PathParam('id') id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Book detail')),
      body: Center(
        child: Column(
          children: [
            Text('${RouteData.of(context).pathParams.get('id')}'),
            TextButton(
              child: const Text('Log out'),
              onPressed: () {},
            ),
            TextButton(
              child: const Text('Go to purchase'),
              onPressed: () {
                context.pushRoute(const BuyBookRoute());
              },
            ),
          ],
        ),
      ),
    );
  }
}
