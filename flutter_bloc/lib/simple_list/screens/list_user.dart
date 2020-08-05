


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_bloc.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_event.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_state.dart';
import 'package:flutterbloc/widget/alert.dart';

class ListUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListUserStateHome();
  }
}

class ListUserStateHome extends State<ListUser> {

  ListUserBloc _listUserBloc;

  @override
  void initState() {
    super.initState();
    _listUserBloc = BlocProvider.of<ListUserBloc>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is List User'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add),
              onPressed: () {
                  Alert.showAlertOneTextField(context, (str) {
                    _listUserBloc.add(EventAddUser(name: str));
                    Navigator.pop(context);
                  });
              })
        ],
      ),
      body: SafeArea(
        child: Container(
          child: BlocBuilder<ListUserBloc, ListUserState>(
            builder: (context, state) {
              if (state is ListUserInitial) {
                return Center(child: Text('Not user'),);
              } else if (state is ListUserLoading) {
                return Center(child: CircularProgressIndicator(),);
              } else if (state is ListUserSuccess) {
                return Container(
                  child: ListView.builder(
                      itemCount: state.users.length,
                      itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      leading: Text('${state.users[index].id}'),
                      title: Text('${state.users[index].name}'),
                      onTap: (){
                       Alert.showAlertOneTextField(context, (str) {
                         _listUserBloc.add(EventUpdateUser(index: index, name: str));
                         Navigator.pop(context);
                       });
                      },
                      trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _listUserBloc.add(EventDeleteUser(index: index));
                          }),
                    );
                  }),
                );
              } else if (state is ListUserError)  {
                return Center(child: Text('${state.msg}'),);
              } else {
                return Container();
              }
            },
          ),
        ),
      ) ,
    );
  }
}