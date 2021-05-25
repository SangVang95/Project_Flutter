import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiRequest {
  final String url;
  final Map params;

  ApiRequest({@required this.url, this.params});

  Dio _dio() {
    return Dio(BaseOptions());
  }

  void get(Function beforeSend, Function(dynamic data) onSuccess,
      Function(dynamic error) onError) async {
    await _dio().get(this.url, queryParameters: this.params).then((result) {
      if (onSuccess != null) onSuccess(result.data);
    }).catchError((error) {
      if (onError != null) onError(error);
    });
  }
}
