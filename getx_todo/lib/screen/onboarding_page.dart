import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_todo/controller/onboarding_controller.dart';

class OnboardingPage extends GetWidget {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(FlutterConfig.get('APP_NAME')),
        ),
        body: SafeArea(
          child: GetBuilder(
            builder: (OnboardingController controller) => PageView.builder(
                controller: pageController,
                itemCount: controller.listOnboarding.length,
                onPageChanged: (value) {
                  print(value);
                  controller.selectedIndex.value = value;
                },
                itemBuilder: (content, index) => Container(
                      child: Column(
                        children: [
                          Text(controller.listOnboarding[index].title),
                          SizedBox(
                            height: 200,
                          ),
                          Text(controller.listOnboarding[index].description),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                controller.listOnboarding.length,
                                (index) => Obx(
                                  () => Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2),
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        color: controller.selectedIndex.value ==
                                                index
                                            ? Colors.red
                                            : Colors.blue,
                                        shape: BoxShape.circle,
                                      )),
                                ),
                              )),
                          SizedBox(
                            height: 200,
                          ),
                          IconButton(
                              onPressed: () {
                                pageController.nextPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              icon: Icon(Icons.navigate_next))
                        ],
                      ),
                    )),
          ),
        ));
  }
}
