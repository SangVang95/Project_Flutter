import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_todo/get_view/counter_controller.dart';
import 'package:get/get.dart';
import 'package:getx_todo/screen/home_page.dart';

class CounterPage extends GetView<CounterController> {
  @override
  Widget build(BuildContext context) {
    Get.put(CounterController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Get View'),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('${controller.value}')),
            TextButton(
                onPressed: () {
                  controller.increment();
                },
                child: Text('Tang')),
            TextButton(
                onPressed: () {
                  Get.to(HomePage());
                },
                child: Text('MOVe'))
          ],
        ),
      ),
    );
  }
}
