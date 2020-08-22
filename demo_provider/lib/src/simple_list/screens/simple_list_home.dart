import 'package:demo_provider/src/simple_list/provider/simple_list_provider.dart';
import 'package:demo_provider/src/simple_list/theme_simple_list/simple_list_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SimpleListHome extends StatefulWidget {
  @override
  _SimpleListHomeState createState() => _SimpleListHomeState();
}

class _SimpleListHomeState extends State<SimpleListHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final list = context.watch<SimpleListProvider>().listUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.watch<SimpleListTheme>().color,
        title: Text('This is Simple List'),
        actions: [
          FlatButton(
              onPressed: () {
                context.read<SimpleListProvider>().fetchUser();
              },
              child: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Text("${list[index].name}");
                }),
          ),
        ),
      ),
    );
  }
}
