part of 'post.dart';

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post()
    // ..id = ['id'] as int
    ..title = json['title'] as String
    ..body = json['body'] as String;
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      // 'id': instance.id,
      'title': instance.title,
      'body': instance.body
    };
