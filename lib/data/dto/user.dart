class UserDto {
  final int id;

  UserDto({required this.id});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'],
    );
  }
}
