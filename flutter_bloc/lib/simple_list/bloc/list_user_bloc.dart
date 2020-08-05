
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterbloc/repository/networking.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_event.dart';
import 'package:flutterbloc/simple_list/bloc/list_user_state.dart';
import 'package:flutterbloc/simple_list/model/user.dart';

class ListUserBloc extends Bloc<ListUserEvent, ListUserState> {

  @override
  // TODO: implement initialState
  ListUserState get initialState => ListUserInitial();

  @override
  Stream<ListUserState> mapEventToState(ListUserEvent event) async* {
    final currentState = state;
    yield ListUserLoading();

    if (event is EventGetUser) {
      try {
        final users =  await Repository.getUser();
        yield ListUserSuccess(users: users);
      } catch (err) {
        yield ListUserError(msg: err);
      }
    } else if (event is EventUpdateUser && currentState is ListUserSuccess) {
      yield ListUserLoading();
       currentState.users[event.index].name = event.name;
       yield ListUserSuccess(users: currentState.users);

    } else if (event is EventDeleteUser && currentState is ListUserSuccess) {
      yield ListUserLoading();
      currentState.users.removeAt(event.index);
      yield ListUserSuccess(users: currentState.users);
    } else if (event is EventAddUser && currentState is ListUserSuccess) {
      yield ListUserLoading();

      List<int> _list = [];

      for (var item in currentState.users) {
        _list.add(item.id);
      }
      final id = _list.reduce((pre, cur) => pre > cur ? pre : cur);

      var newUser = User(name: event.name, id: id + 1);
      currentState.users.add(newUser);
      yield ListUserSuccess(users: currentState.users);
    }
  }
}