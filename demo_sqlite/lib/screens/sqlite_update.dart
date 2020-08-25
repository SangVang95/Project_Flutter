


import 'package:demo_sqlite/model/dog.dart';
import 'package:demo_sqlite/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SQliteUpdate extends StatefulWidget {
  @override
  _SQliteUpdateState createState() => _SQliteUpdateState();
}

class _SQliteUpdateState extends State<SQliteUpdate> {

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _idController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _idController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SQLite Update"),),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 20,),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  hintText: "new ID",
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "new Name",
                ),
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                  hintText: "New Age"
                ),
              ),
              RaisedButton(
                child: Text("Confirm"),
                  onPressed: () async {
                  final newDog = Dog(id: int.parse("${_idController.text.trim()}"),name: _nameController.text.trim(), age: int.parse("${_ageController.text.trim()}"));
                  context.read<SqliteProvider>().updateDog(newDog);
                  Navigator.pop(context);
              })
            ],
          ),
        ),
      ),
    );
  }
}
