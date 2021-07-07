import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CounterController extends GetxController {
  // var _count = 0;

  // int get count => _count;

  // void increment() {
  //   _count++;
  //   update();
  // }

  final count = 0.obs;

  updateCount(int count) {
    count.obs.update((val) {
      val = count;
    });
  }
}
