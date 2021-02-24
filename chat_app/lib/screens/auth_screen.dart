import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final _scafoldKey = GlobalKey<ScaffoldState>();

  void _submitAuthForm(
      String email, String username, String password, bool isLogin) async {
    UserCredential _userCredential;
    try {
      if (isLogin) {
        _userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        _userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      }
    } on PlatformException catch (error) {
      var message = 'An error occured, please check your credential';
      if (error.message != '') {
        message = error.message;
      }
      Scaffold.of(context).showSnackBar(SnackBar(
          key: _scafoldKey,
          backgroundColor: Theme.of(context).errorColor,
          content: Text(message)));
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm),
    );
  }
}
