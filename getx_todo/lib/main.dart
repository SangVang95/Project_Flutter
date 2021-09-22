import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo/binding.dart/app_binding.dart';
import 'package:getx_todo/get_view/counter_page.dart';
import 'package:getx_todo/screen/home_page.dart';
import 'package:getx_todo/screen/onboarding_page.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized(); // Required by FlutterConfig
  await FlutterConfig.loadEnvVariables();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AppBinding(),
      home: OnboardingPage(),
    );
  }
}
