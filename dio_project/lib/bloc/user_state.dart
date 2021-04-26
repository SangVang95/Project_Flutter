import 'package:dio_project/model/post.dart';
import 'package:dio_project/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserState extends Equatable {}

class UserLoading extends UserState {
  @override
  List<Object> get props => throw UnimplementedError();
}

class UserLoaded extends UserState {
  final List<User> users;

  UserLoaded({@required this.users});
  @override
  List<Object> get props => [this.users];
}

class PostLoaded extends UserState {
  final Post post;
  PostLoaded({@required this.post});

  @override
  List<Object> get props => throw UnimplementedError();
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => throw UnimplementedError();
}
