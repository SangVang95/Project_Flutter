import 'package:dio/dio.dart';

import 'api_reponse.dart';

class HttpService {
  Dio _dio;

  final baseUrl = "https://jsonplaceholder.typicode.com";

  HttpService() {
    _dio = Dio(BaseOptions(
        responseType: ResponseType.plain,
        connectTimeout: 30000,
        receiveTimeout: 30000,
        baseUrl: baseUrl,
        headers: {"Content-Type": "application/json"}));
    initInterCertor();
  }

  initInterCertor() {
    _dio.interceptors.add(InterceptorsWrapper(onError: (error, handler) {
      print(error.message);
      return handler.next(error);
    }, onRequest: (option, handler) {
      print(option.method);
      print(option.path);
      print(option.baseUrl);
      return handler.next(option);
    }, onResponse: (response, handler) {
      print(response.data);
      return handler.next(response);
    }));
  }

  Future<ApiResponse> getRequest(String endpoint) async {
    ApiResponse _response = ApiResponse.loading("loading");
    try {
      final response = await _dio.get(endpoint);
      if (response.statusCode == 200) {
        _response = ApiResponse.completed(response.data);
      } else {
        _response = ApiResponse.error("message");
      }
    } catch (error) {
      print(error.message);
      _response = ApiResponse.error(error.message);
    }
    return _response;
  }
}
