import 'package:chat_app/map/providers/great_places.dart';
import 'package:chat_app/map/screens/add_place_page.dart';
import 'package:chat_app/map/screens/places_list_page.dart';
import 'package:chat_app/screens/auth_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MapApp());
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
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          if (snapshot.hasData) {
            return ChatScreen();
          }
          return AuthScreen();
        },
      ),
    );
  }
}

class MapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlaces(),
      builder: (context, child) => MaterialApp(
        title: 'Greate place',
        theme:
            ThemeData(primarySwatch: Colors.indigo, accentColor: Colors.amber),
        home: PlacesList(),
        routes: {AddPlacePage.route: (context) => AddPlacePage()},
      ),
    );
  }
}
