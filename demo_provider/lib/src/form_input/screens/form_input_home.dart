



import 'package:demo_provider/src/form_input/provider/form_input_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormInputHome extends StatefulWidget {
  @override
  _FormInputHomeState createState() => _FormInputHomeState();
}

class _FormInputHomeState extends State<FormInputHome> {

  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is Form Input'),),
      body: SafeArea(
        child: Container(
          child: Form(
            child: Consumer<FormInputProvider>(
              builder: (context, provider, child) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (provider.isValid == null) ? Colors.orange : provider.isValid == true ? Colors.blue : Colors.red
                      ),
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(height: 16,),
                    TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Give your age",
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      width: double.infinity,
                      child: FlatButton(
                        child: Text("Check"),
                        color: Colors.blue,
                        textColor: Colors.white,
                        onPressed: () {
                          final String age = _controller.text;
                          context.read<FormInputProvider>().checkValidate(ten: age);
                        },
                      ),
                    ),
                    SizedBox(height: 16,),
                    Text('${provider.validMessage}')
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
