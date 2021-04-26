import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class UserEvent extends Equatable {}

class GetUser extends UserEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class CreatePost extends UserEvent {
  final Map<String, dynamic> post;
  CreatePost({@required this.post});
  @override
  List<Object> get props => throw UnimplementedError();
}
