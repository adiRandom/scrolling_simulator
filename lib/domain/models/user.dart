import '../../data/dto/user.dart';

class User {
  final int id;
  final String username;
  final String avatarUrl;

  const User({
    required this.id,
    required this.username,
    required this.avatarUrl,
  });

  User.fromDto(UserDto dto)
      : id = dto.id,
        // TODO: Parse
        username = "",
        avatarUrl = "";
}
