
import 'package:demo_call_api/src/model/user.dart';
import 'package:demo_call_api/src/networking/user_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserPageState();
  }
}

class UserPageState extends State<UserPage> {
//  Future<[User]> _future;

  Future<List<User>> _future;

  @override
  void initState() {
    super.initState();
    _future = UserApi.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('This is app bar'), actions: <Widget>[
        IconButton(onPressed: () {
          Navigator.pushNamed(context, '/dt');
          }, icon: Icon(Icons.chevron_right),)

      ],),
      body: Center(
        child: FutureBuilder<List<User>>(
          future: _future,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder:(BuildContext context, index) {
                    return ListTile(
                      title: Text('${snapshot.data[index].name}'),
                    );
                  });
            } else if (snapshot.hasError){
              return Text('${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

}