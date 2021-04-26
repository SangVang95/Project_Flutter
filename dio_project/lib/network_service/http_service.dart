import 'package:dio/dio.dart';

class HttpService {
  Dio _dio;

  final baseUrl = "https://jsonplaceholder.typicode.com";

  HttpService() {
    _dio = Dio(BaseOptions(
        responseType: ResponseType.json,
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

  Future<dynamic> getRequest(String endpoint) async {
    dynamic data;
    try {
      final _response = await _dio.get(endpoint);
      if (_response.statusCode == 200 || _response.data == 201) {
        data = _response.data;
      } else {
        print(_response.statusMessage);
      }
    } catch (error) {
      print(error.message);
    }
    return data;
  }

  Future<dynamic> postRequest(
      String endpoint, Map<String, dynamic> params) async {
    dynamic data;
    try {
      final _response = await _dio.post(endpoint, data: params);
      if (_response.statusCode == 200 || _response.statusCode == 201) {
        data = _response.data;
      } else {
        data = _response.statusMessage;
      }
    } catch (error) {
      print(error.toString());
    }
    return data;
  }
}
