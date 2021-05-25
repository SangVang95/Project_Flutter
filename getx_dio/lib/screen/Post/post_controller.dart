import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_dio/model/post.dart';
import 'package:getx_dio/screen/Post/post_provider.dart';

class PostControler extends GetxController {
  var isLoading = true;
  List<Post> posts = [];
  @override
  void onInit() {
    PostProvider().getPosts(() {
      print("Sending");
    }, (posts) {
      this.posts = posts;
      isLoading = false;
      print(posts);
      update();
    }, (error) {
      print(error);
      isLoading = false;
    });
    super.onInit();
  }
}
