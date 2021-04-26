import 'package:dio_project/bloc/user_bloc.dart';
import 'package:dio_project/bloc/user_event.dart';
import 'package:dio_project/bloc/user_state.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => context.read<UserBloc>().add(GetUser())),
          IconButton(
              icon: Icon(Icons.open_in_browser),
              onPressed: () => context
                  .read<UserBloc>()
                  .add(CreatePost(post: {'title': 'Rio', 'body': 'Van'})))
        ],
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, state) {
          if (state is UserLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoaded) {
            return Container(
              child: ListView.builder(
                  itemCount: state.users.length,
                  itemBuilder: (context, i) => Text(state.users[i].name)),
            );
          } else if (state is UserError) {
            return Center(
              child: Text(state.message),
            );
          } else if (state is PostLoaded) {
            return Center(child: Text(state.post.title));
          } else {
            return Center(
              child: Text('Another state'),
            );
          }
        },
      ),
    );
  }
}
