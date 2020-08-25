

import 'package:demo_sqlite/provider/provider.dart';
import 'package:demo_sqlite/router/router.dart';
import 'package:demo_sqlite/screens/sqlite_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SQliteApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/',
    );
  }
}
