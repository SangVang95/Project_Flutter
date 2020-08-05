


class User {
  String name;
  int id;
  User({this.name, this.id});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      id: json['id'] as int
    );
  }

}