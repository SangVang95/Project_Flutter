import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:getx_dio/screen/couter/couter_controller.dart';

class CounterPage extends StatelessWidget {
  final CounterController _controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    print('Rebuild');
    return Scaffold(
      body: Center(
        child: Obx(() => Text('${Get.find<CounterController>().count.value}')),
        // GetX<CounterController>(init: CounterController(), builder: (_) => Text(data)),
        // child: GetBuilder<CounterController>(
        //   // init: _controller,
        //   builder: (_) => Text('${_.count}'),
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          print(1);
          _controller.updateCount(10);
        },
      ),
    );
  }
}
