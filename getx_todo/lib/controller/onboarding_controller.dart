import 'package:get/get.dart';
import 'package:getx_todo/model/onboarding.dart';

class OnboardingController extends GetxController {
  var listOnboarding = [
    Onboarding(title: "ON 1", description: "Description of onboarding 1"),
    Onboarding(title: "ON 2", description: "Description of onboarding 2"),
    Onboarding(title: "ON 3", description: "Description of onboarding 3")
  ];
  var selectedIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
}
