// ignore_for_file: prefer_const_constructors, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_network/modules/user/user_controller.dart';

class UserPage extends GetView<UserController> {
  const UserPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TEST NETWORK'),
        actions: [
          IconButton(
              onPressed: () {
                controller.createUser();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Obx(() => controller.isLoading.value
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: controller.users.value.length,
                itemBuilder: (context, index) =>
                    Text(controller.users.value[index].name))),
      ),
    );
  }
}
