part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..id = ['id'] as int
    ..name = json['name'] as String
    ..phone = json['phone'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone
    };
