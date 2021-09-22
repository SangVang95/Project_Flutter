import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:getx_dio/model/post.dart';
import 'package:getx_dio/screen/post/post_provider.dart';

class PostControler extends GetxController with StateMixin<List<Post>> {
  var isLoading = true;
  List<Post> posts = [];
  @override
  void onInit() {
    PostProvider().getPosts(() {
      print("Sending");
    }, (posts) {
      change(posts, status: RxStatus.success());
      print(posts);
      update();
    }, (error) {
      print(error);
      change(null, status: RxStatus.error(error.toString()));
    });
    super.onInit();
  }

  void createPost() {
    PostProvider().createPost(() {
      print("Before dens");
    }, (post) {
      print(post.title);
      print(post.body);
    }, (error) {
      print(error.toString());
    });
  }
}
