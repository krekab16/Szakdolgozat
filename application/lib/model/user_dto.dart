class UserDTO {
  late String name;
  late String username;
  late String email;
  late String password;
  late bool isOrganizer;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
      'isOrganizer': isOrganizer,
    };
  }
}
