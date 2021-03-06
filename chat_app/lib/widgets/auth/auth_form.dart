import 'dart:io';

import 'package:chat_app/widgets/picker_image/user_image_picker.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  final void Function(String, String, String, bool, File) submitFirebase;
  final bool isLoading;

  AuthForm(this.submitFirebase, this.isLoading);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = false;
  String _email;
  String _password;
  String _username;
  File _userImage;

  void _trySubmit() {
    final isValid = _formKey.currentState.validate();
    FocusScope.of(context).unfocus();

    if (_userImage == null && !_isLogin) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please add image...'),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }
    if (isValid) {
      _formKey.currentState.save();
      widget.submitFirebase(_email, _username, _password, _isLogin, _userImage);
    }
  }

  void _pickedImage(File file) {
    _userImage = file;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (!_isLogin)
                      UserImagePicker(
                        imagePicker: _pickedImage,
                      ),
                    TextFormField(
                      key: ValueKey('email'),
                      validator: (value) {
                        if (value.isEmpty || !value.contains('@')) {
                          return 'Email is invalid';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(labelText: 'Email'),
                      onSaved: (value) {
                        _email = value.trim();
                      },
                    ),
                    if (!_isLogin)
                      TextFormField(
                        key: ValueKey('username'),
                        validator: (value) {
                          if (value.length < 4 || value.isEmpty) {
                            return 'Username is invalid';
                          }
                          return null;
                        },
                        decoration: InputDecoration(labelText: 'Username'),
                        onSaved: (value) {
                          _username = value.trim();
                        },
                      ),
                    TextFormField(
                      key: ValueKey('password'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 6) {
                          return 'Password is invalid';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      onSaved: (value) {
                        _password = value.trim();
                      },
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    if (widget.isLoading) CircularProgressIndicator(),
                    if (!widget.isLoading)
                      ElevatedButton(
                          child: Text(_isLogin ? 'Login' : 'Signup'),
                          onPressed: () => _trySubmit()),
                    if (!widget.isLoading)
                      TextButton(
                          child: Text(
                            _isLogin
                                ? 'Create new account'
                                : 'I already have an account',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.lightBlue),
                          ),
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          })
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
