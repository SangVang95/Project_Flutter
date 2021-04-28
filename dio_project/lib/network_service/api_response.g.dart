part of 'api_response.dart';

ApiResponse<T> _$ApiResponseFromJson<T>(Map<String, dynamic> json) {
  return ApiResponse<T>(
    message: json['message'],
    status: json['status'],
    data: ApiResponse.dataFromJson(json['data']),
  );
}
