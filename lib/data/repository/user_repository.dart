import 'package:scrolling_simulator/domain/models/user.dart';

class UserRepository {
  static final UserRepository _singleton = UserRepository._internal();

  UserRepository._internal();

  factory UserRepository() {
    return _singleton;
  }

  User getCurrentUser() {
    return const User(id: 1, username: "Alex", avatarUrl: "");
  }
}
