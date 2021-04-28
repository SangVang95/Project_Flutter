import 'package:dio_project/model/post.dart';
import 'package:dio_project/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable()
class ApiResponse<T> {
  final int status;
  final String message;
  final T data;

  // ApiResponse.loading(this.message) : status = Status.LOADING;

  // ApiResponse.completed(this.data) : status = Status.COMPLETED;

  // ApiResponse.error(this.message) : status = Status.ERROR;

  ApiResponse({this.status, this.message, this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

  static T dataFromJson<T>(Object json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('name')) {
        return User.fromJson(json) as T;
      }
      if (json.containsKey('body')) {
        return Post.fromJson(json) as T;
      }
    }

    if (json is List) {
      return json.map((e) => User.fromJson(e as Map<String, dynamic>)).toList()
          as T;
    }

    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}

class $ApiResponseFromJson {}

// enum Status { LOADING, COMPLETED, ERROR }

// class DeserializeAction<T> {
//   final String json;
//   Deserialize(this.json);

//   T invoke() {
//     // return modelListFromJsonString<T>(json);
//     return dataFromJson<T>(json);
//   }

//   static dynamic _invoke(DeserializeAction a) => a.invoke();
// }

// T deserialize<T>(String json) => compute(DeserializeAction._invoke, DeserializeAction<T>(json));
