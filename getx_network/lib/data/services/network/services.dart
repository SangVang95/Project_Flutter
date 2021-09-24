import 'package:dio/dio.dart';
import 'package:getx_network/data/services/network/base_url.dart';
import 'package:getx_network/data/model/response/response.dart' as model;
import 'package:getx_network/data/services/network/endpoint.dart';

class DioService {
  final Dio _dio;
  DioService() : _dio = Dio(BaseOptions(baseUrl: BaseUrl.url));

  Future<model.Response> request(Endpoint endpoint) async {
    final options = Options(
        contentType: Headers.jsonContentType,
        method: endpoint.method,
        responseType: ResponseType.json);
    try {
      Response response = await _dio.request(endpoint.path,
          options: options,
          queryParameters: endpoint.params,
          data: endpoint.params);
      return model.Response(data: response.data);
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data is Map) {
          throw (e.response?.data['message'] ?? 'Cannot connect to server');
        } else {
          throw (e.response?.statusMessage ?? e.message);
        }
      } else {
        throw ('Cannot connect to server');
      }
    }
  }
}
