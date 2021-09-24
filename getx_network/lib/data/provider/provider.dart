import 'package:getx_network/data/api/user/user_api.dart';
import 'package:getx_network/data/services/network/services.dart';

class Provider {
  static final shared = Provider._();
  final DioService _dioService = DioService();
  Provider._();

  UserAPI get userApi => UserAPI(_dioService);
}
