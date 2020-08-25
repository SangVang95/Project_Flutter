


import 'dart:convert';

class Dog {
  int id;
  String name;
  int age;
  Dog({this.id, this.name, this.age});

  factory Dog.fromMap(Map<String, dynamic> json) {
    return Dog(
      id: json['id'],
      name: json['name'],
      age: json['age']
    );
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'age': age
  };
}


Dog dogFromJson(String str) {
  final jsonData = json.decode(str);
  return Dog.fromMap(jsonData);
}

String dogToJson(Dog data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}


//id INTEGER PRIMARY KEY, name TEXT, age INTEGER