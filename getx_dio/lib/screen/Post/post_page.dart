import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_dio/screen/Post/post_controller.dart';

class PostPage extends GetWidget<PostControler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
      ),
      // body: Container(
      //   child: GetBuilder<PostControler>(
      //     builder: (controller) {
      //       print("rebuild Post controller");
      //       return Loading(
      //         isLoading: controller.isLoading,
      //         child: ListView.builder(
      //             itemCount: controller.posts.length,
      //             itemBuilder: (context, index) => postCard(
      //                   controller.posts[index].title,
      //                   controller.posts[index].body,
      //                 )),
      //       );
      //     },
      //   ),
      // ),
      body: controller.obx(
          (state) => ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) =>
                  postCard(state[index].title, state[index].body, controller)),
          onLoading: Center(
            child: CircularProgressIndicator(),
          ),
          onError: (err) => Center(
                child: Text(err),
              )),
    );
  }
}

Widget postCard(String title, String content, PostControler controller) {
  return Card(
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('title: $title'),
          // SizedBox(
          //   height: 20,
          // ),
          Text(
            'content: $content',
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10,
          ),
          IconButton(
            onPressed: () {
              controller.createPost();
            },
            icon: Icon(Icons.show_chart),
          )
          // Builder(
          //     builder: (BuildContext context) => IconButton(
          //           onPressed: () {
          //             final snackBar = SnackBar(content: Text('show'));
          //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
          //           },
          //           icon: Icon(Icons.show_chart),
          //         ))
        ],
      ),
    ),
  );
}
