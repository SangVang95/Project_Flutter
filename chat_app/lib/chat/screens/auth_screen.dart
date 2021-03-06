import 'dart:io';

import 'package:chat_app/widgets/auth/auth_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  final _scafoldKey = GlobalKey<ScaffoldState>();
  var _isLoading = false;

  void _submitAuthForm(String email, String username, String password,
      bool isLogin, File userImage) async {
    UserCredential _userCredential;
    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        _userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        _userCredential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        final ref = FirebaseStorage.instance
            .ref()
            .child('user_image')
            .child(_userCredential.user.uid + '.jpg');

        await ref.putFile(userImage);
        final urlImage = await ref.getDownloadURL();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(_userCredential.user.uid)
            .set({
          'username': username,
          'email': email,
          'password': password,
          'urlImage': urlImage
        });
      }
    } on FirebaseAuthException catch (error) {
      var message = 'An error occured, please check your credential';
      if (error.message != '') {
        message = error.message;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          key: _scafoldKey,
          backgroundColor: Theme.of(context).errorColor,
          content: Text(message)));

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AuthForm(_submitAuthForm, _isLoading),
    );
  }
}
