import 'package:dio_project/bloc/user_event.dart';
import 'package:dio_project/bloc/user_state.dart';
import 'package:dio_project/network_service/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class UserCubit extends Cubit<UserState> {
//   final UserRepository _userRepository = UserRepository();

//   UserCubit() : super(UserLoading());

//   Future getUser() async {
//     await _userRepository
//         .getUsers()
//         .then((users) => emit(UserLoaded(users: users)))
//         .catchError((error) => emit(UserError(error)));
//   }
// }

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepository = UserRepository();
  UserBloc() : super(UserLoading());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is GetUser) {
      try {
        final users = await _userRepository.getUsers();
        print("-----------------");
        print(users);
        yield UserLoaded(users: users);
      } catch (error) {
        yield UserError(error);
      }
    } else if (event is CreatePost) {
      try {
        yield UserLoading();
        final post = await _userRepository.postPost(event.post);
        yield PostLoaded(post: post);
      } catch (error) {
        yield UserError(error);
      }
    }
  }
}
