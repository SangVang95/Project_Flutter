import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiError {
  static showDialog(Error) {
    Get.dialog(Dialog(
      child: Column(
        children: [
          Text("Error"),
          ElevatedButton(
              onPressed: () {
                print("019237417239");
                if (Get.isDialogOpen) Get.back();
              },
              child: Text("OK"))
        ],
      ),
    ));
  }
}
