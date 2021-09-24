// ignore_for_file: constant_identifier_names

class Endpoint {
  final HTTPMethod _method;
  final dynamic params;
  final String path;
  String method = '';

  Endpoint(this.params, this.path, this._method) {
    switch (_method) {
      case HTTPMethod.POST:
        method = 'POST';
        break;
      case HTTPMethod.DELETE:
        method = 'DELETE';
        break;
      case HTTPMethod.PUT:
        method = 'PUT';
        break;
      default:
        method = 'GET';
    }
  }
}

enum HTTPMethod { GET, PUT, POST, DELETE }
