import 'package:demo_sqlite/model/dog.dart';
import 'package:demo_sqlite/provider/provider.dart';
import 'package:demo_sqlite/widget/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SQLiteHome extends StatefulWidget {
  @override
  _SQLiteHomeState createState() => _SQLiteHomeState();
}

class _SQLiteHomeState extends State<SQLiteHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SqliteProvider>().getListDog();
  }

  _callbackDisplayListDog(BuildContext context) async {
    final result = await Navigator.pushNamed(context, '/ud');
    context.read<SqliteProvider>().getListDog();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is SQLite App"),
        actions: [
          FlatButton(
              onPressed: () {
                Alert.showAlertOneTextField(context, (newDog) {
                  context.read<SqliteProvider>().saveDog(newDog);
                  Navigator.pop(context);
                });
              },
              child: Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: Consumer<SqliteProvider>(
          builder: (context, provider, child) {
            return Container(
              child: ListView.builder(
                  itemCount: provider.listDog.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                        onDismissed: (direction) {
                          provider.deleteDog(provider.listDog[index].id);
                        },
                        background: Container(
                          color: Colors.red,
                        ),
                        key: UniqueKey(),
                        child: ListTile(
                          title: Text("${provider.listDog[index].name}"),
                          leading: Text("${provider.listDog[index].id}"),
                          subtitle: Text("${provider.listDog[index].age}"),
                          trailing: FlatButton(
                            child: Text("Update"),
                            onPressed: () {
                              _callbackDisplayListDog(context);
                            },
                          ),
                        ));
                  }),
            );
          },
        ),
      ),
    );
  }
}
