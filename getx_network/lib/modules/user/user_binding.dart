import 'package:get/get.dart';
import 'package:getx_network/modules/user/user_controller.dart';
import 'package:getx_network/modules/user/user_repository.dart';

class UserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController(UserRepository()));
  }
}
