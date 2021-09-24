import 'package:getx_network/data/api/user/user_param.dart';
import 'package:getx_network/data/model/user.dart';
import 'package:getx_network/data/provider/provider.dart';

class UserRepository {
  Future<List<User>> getAllUser() {
    return Provider.shared.userApi.getAllUser();
  }

  Future<User> createUser(UserParams params) {
    return Provider.shared.userApi.createUser(params);
  }
}
