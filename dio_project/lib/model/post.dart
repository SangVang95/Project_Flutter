import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post {
  // @JsonKey(name: "id")
  // int id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "body")
  String body;

  Post();

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
