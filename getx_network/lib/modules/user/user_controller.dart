// ignore_for_file: invalid_return_type_for_catch_error

import 'package:get/get.dart';
import 'package:getx_network/data/api/user/user_param.dart';
import 'package:getx_network/data/model/user.dart';
import 'package:getx_network/modules/user/user_repository.dart';

class UserController extends GetxController {
  final UserRepository _repository;
  UserController(this._repository);

  final users = RxList<User>([]);
  final errMessage = Rx<String?>(null);
  final user = Rx<User?>(null);
  final isLoading = Rx<bool>(true);

  @override
  void onInit() {
    _getUsers();
    super.onInit();
  }

  _getUsers() {
    _repository
        .getAllUser()
        .then((value) => users.value = value)
        .catchError((e) {
      errMessage.value = e.toString();
    }).whenComplete(() => isLoading.value = false);
  }

  void createUser() {
    _repository
        .createUser(UserParams.createUser(id: 101, name: 'Danasa'))
        .then((value) => user.value = value)
        .catchError((e) => errMessage.value = e.toString())
        .whenComplete(() => isLoading.value = false);
  }
}
