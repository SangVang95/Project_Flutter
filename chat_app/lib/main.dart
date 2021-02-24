import 'package:chat_app/screens/auth_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          accentColorBrightness: Brightness.dark,
          primarySwatch: Colors.blue,
          backgroundColor: Colors.pink,
          accentColor: Colors.purpleAccent,
          buttonTheme: ButtonTheme.of(context).copyWith(
              textTheme: ButtonTextTheme.primary,
              buttonColor: Colors.pink,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
      home: AuthScreen(),
    );
  }
}
