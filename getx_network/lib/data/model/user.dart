// ignore_for_file: prefer_collection_literals

class User {
  int id;
  String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(id: json['id'], name: json['name']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    return data;
  }
}
