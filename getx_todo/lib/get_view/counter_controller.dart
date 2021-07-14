import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class CounterController extends GetxController {
  var value = 0.obs;

  void increment() {
    value++;
  }
}
