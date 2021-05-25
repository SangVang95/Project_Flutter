import 'package:getx_dio/Networking/api_request.dart';
import 'package:getx_dio/model/post.dart';

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
}
