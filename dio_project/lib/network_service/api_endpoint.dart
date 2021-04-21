enum UserEndpoint { listUser, user }

class ApiEndpoint {
  static String userEnpoint(UserEndpoint userEndpoint) {
    switch (userEndpoint) {
      case UserEndpoint.listUser:
        return '/users';
      default:
        return '';
    }
  }
}
