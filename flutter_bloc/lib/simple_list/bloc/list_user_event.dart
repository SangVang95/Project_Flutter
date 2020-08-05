

import 'package:equatable/equatable.dart';

abstract class ListUserEvent extends Equatable {
  ListUserEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class EventGetUser extends ListUserEvent {}
class EventUpdateUser extends ListUserEvent {

  final int index;
  final String name;
  EventUpdateUser({this.index, this.name}): assert(index != null, name != null);

  @override
  // TODO: implement props
  List<Object> get props => [index, name];
}

class EventDeleteUser extends ListUserEvent {

  final int index;
  EventDeleteUser({this.index});

  @override
  // TODO: implement props
  List<Object> get props => [index];
}

class EventAddUser extends ListUserEvent {

  final String name;
  EventAddUser({this.name});

  @override
  // TODO: implement props
  List<Object> get props => [name];
}

