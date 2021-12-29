import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:navigator20/routes/router.gr.dart';
import 'package:navigator20/screens/dashboard_page.dart';

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
                  // AutoRouter.of(context).pushNamed('/second-page');
                  context.router.push(SecondRoute(name: 'Dev'));
                },
                child: const Text('Second page')),
            TextButton(
                onPressed: () {
                  // context.router.pushNamed('/third-page');
                  gotoThirdPage(context);
                },
                child: const Text('Thrid page')),
            TextButton(
                onPressed: () {
                  context.router.push(DashboardRoute());
                },
                child: const Text('Dashboard page'))
          ],
        ),
      ),
    );
  }

  void gotoThirdPage(BuildContext context) async {
    var result = await context.router.push(ThirdRoute());
    print(result);
  }
}
