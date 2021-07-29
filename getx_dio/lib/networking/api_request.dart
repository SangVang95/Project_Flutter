import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:getx_dio/networking/api_error.dart';

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
      // if (onError != null) onError(error);

      ApiError.showDialog(error);
    });
  }

  void post(Function beforeSend, Function(dynamic data) onSuccess,
      Function(dynamic error) onError) async {
    await _dio().post(this.url, data: jsonEncode(params)).then((value) {
      if (onSuccess != null) onSuccess(value.data);
    }).catchError((err) {
      if (onError != null) onError(err);
    });
  }
}
