import 'package:getx_dio/model/post.dart';
import 'package:getx_dio/networking/api_request.dart';

class PostProvider {
  void getPosts(Function beforeSend, Function(List<Post> posts) onSuccess,
      Function(dynamic error) onError) async {
    ApiRequest(url: 'https://jsonplaceholder.typicode.com/posts', params: null)
        .get(beforeSend(), (data) {
      var json = data as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      onSuccess(posts);
    }, (error) => onError(error));
  }

  void createPost(Function beforeSend, Function(Post post) onSuccess,
      Function(dynamic error) onError) async {
    ApiRequest(
            url: 'https://jsonplaceholder.typicode.com/posts',
            params: {'title': 'Sang Sang', 'body': 'Please handsome guy!'})
        .post(beforeSend(), (data) {
      final post = Post.fromJson(data);
      onSuccess(post);
    }, (error) => onError(error));
  }
}
