import 'package:json_annotation/json_annotation.dart';
part 'album.g.dart';

@JsonSerializable()
class Album {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;

  // Album({this.id, this.title});
  Album();

  factory Album.fromJson(Map<String, dynamic> json) => _$AlbumFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumToJson(this);
}
