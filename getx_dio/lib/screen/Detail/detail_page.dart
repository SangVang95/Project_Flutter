import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class DetailPage extends GetWidget {
  final data = FlutterConfig.get('APP_NAME') ?? 'Detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail'),),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
