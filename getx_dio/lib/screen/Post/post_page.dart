import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_dio/component/loading.dart';
import 'package:getx_dio/screen/Post/post_controller.dart';

class PostPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Container(
        child: GetBuilder<PostControler>(
          builder: (controller) {
            print("rebuild");
            return Loading(
              isLoading: controller.isLoading,
              child: ListView.builder(
                  itemCount: controller.posts.length,
                  itemBuilder: (context, index) =>
                      Text(controller.posts[index].title)),
            );
          },
        ),
      ),
    );
  }
}
