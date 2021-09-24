import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:getx_network/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.user_page,
    );
  }
}
