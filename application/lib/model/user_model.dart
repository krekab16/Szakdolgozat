import 'package:application/model/user_dto.dart';

class UserModel {
  late String name;
  late String username;
  late String email;
  late String password;
  late bool isOrganizer;

  UserModel({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    required this.isOrganizer,
  });

  UserDTO toDTO() {
    return UserDTO(
      name: name,
      username: username,
      email: email,
      password: password,
      isOrganizer: isOrganizer,
    );
  }

  factory UserModel.fromDTO(UserDTO userDTO) {
    return UserModel(
      name: userDTO.name,
      username: userDTO.username,
      email: userDTO.email,
      password: userDTO.password,
      isOrganizer: userDTO.isOrganizer,
    );
  }
}
