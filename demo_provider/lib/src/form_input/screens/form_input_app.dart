

import 'package:demo_provider/src/form_input/provider/form_input_provider.dart';
import 'package:demo_provider/src/form_input/screens/form_input_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormInputApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:ChangeNotifierProvider<FormInputProvider>(
        create: (context) => FormInputProvider(),
        child: FormInputHome(),
      ),
    );
  }
}
