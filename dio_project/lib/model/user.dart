import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Object {
  // @JsonKey(name: "id")
  // int id;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "phone")
  String phone;

  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
