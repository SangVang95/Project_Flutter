import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/router.gr.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  print('1');
                  // AutoRouter.of(context).pushNamed('/second-page');
                  context.router.push(SecondRoute(name: 'Dev'));
                },
                child: const Text('Second page')),
            TextButton(
                onPressed: () {
                  context.router.pushNamed('/third-page');
                },
                child: const Text('Thrid page'))
          ],
        ),
      ),
    );
  }
}
