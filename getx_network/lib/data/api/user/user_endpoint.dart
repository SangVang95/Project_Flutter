import 'package:getx_network/data/api/user/user_param.dart';
import 'package:getx_network/data/services/network/endpoint.dart';

class UserEndpoint {
  // static final shared = UserEndpoint._();
  // UserEndpoint._();
  // pass UserParams at here
  static Endpoint getAllUser() {
    return Endpoint(null, '/users', HTTPMethod.GET);
  }

  static Endpoint createUser(UserParams params) {
    return Endpoint(params.param, '/users', HTTPMethod.POST);
  }
}
