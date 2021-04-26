enum UserEndpoint { listUser, user, post }

class ApiEndpoint {
  static String userEnpoint(UserEndpoint userEndpoint) {
    switch (userEndpoint) {
      case UserEndpoint.listUser:
        return '/users';
      case UserEndpoint.post:
        return '/posts';
      default:
        return '';
    }
  }
}
