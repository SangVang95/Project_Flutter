import 'dart:ffi';

import 'package:dio/dio.dart';

abstract class RequestService {
  Future<Response> request();
  Future<Void> upload();
}
