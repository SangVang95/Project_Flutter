

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterbloc/simple_list/model/user.dart';

abstract class ListUserState extends Equatable {
  ListUserState();

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class ListUserInitial extends ListUserState {}
class ListUserLoading extends ListUserState {}
class ListUserSuccess extends ListUserState {
  final List<User> users;
  ListUserSuccess({this.users});
  @override
  // TODO: implement props
  List<Object> get props => [users];
}

class ListUserError extends ListUserState {
  final String msg;
  ListUserError({this.msg});
}