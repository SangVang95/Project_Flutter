import 'package:demo_provider/src/simple_list/provider/simple_list_provider.dart';
import 'package:demo_provider/src/simple_list/screens/simple_list_home.dart';
import 'package:demo_provider/src/simple_list/theme_simple_list/simple_list_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SimpleListProvider()),
          ChangeNotifierProvider(create: (context) => SimpleListTheme())
        ],
        child: SimpleListHome(),
      ),
    );
  }
}
