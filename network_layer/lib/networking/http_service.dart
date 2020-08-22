import 'dart:io';

import 'package:http/http.dart' as http;


abstract class HttpRequest {
  String get baseUrl;
  String get path;
  HttpMethod get method;
  Map<String, String> get header;
  Map<String, dynamic> get parameters;
  Conten
}