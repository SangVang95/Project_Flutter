import 'package:get/instance_manager.dart';
import 'package:getx_dio/screen/Post/post_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostControler>(() => PostControler());
  }
}
