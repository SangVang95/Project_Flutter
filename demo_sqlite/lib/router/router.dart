import 'package:demo_sqlite/provider/provider.dart';
import 'package:demo_sqlite/screens/sqlite_home.dart';
import 'package:demo_sqlite/screens/sqlite_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => ChangeNotifierProvider(
            create: (context) => SqliteProvider(),
            child: SQLiteHome(),));
      case '/ud':
        return MaterialPageRoute(builder: (_) => ChangeNotifierProvider(
          create: (context) => SqliteProvider(),
          child: SQliteUpdate(),));
      default:
        break;
    }
  }
}