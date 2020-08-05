class Comment {
  String name;
  int id;
  Comment({this.name, this.id});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
        name: json['name'],
        id: json['id'] as int
    );
  }
}