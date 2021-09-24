class UserParams {
  final dynamic param;

  UserParams(this.param);

  static UserParams createUser({required int id, required String name}) {
    return UserParams({'id': id, 'name': name});
  }
}
