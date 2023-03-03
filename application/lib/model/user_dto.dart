class UserDTO {
  late String name;
  late String username;
  late String email;
  late String password;
  late bool isOrganizer;

  UserDTO({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.isOrganizer,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'email': email,
	  'password': password,
      'isOrganizer': isOrganizer,
    };
  }
}
