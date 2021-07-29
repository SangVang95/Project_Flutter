import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:getx_todo/controller/onboarding_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
