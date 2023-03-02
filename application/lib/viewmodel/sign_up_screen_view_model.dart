import 'package:application/model/user_dto.dart';
import 'package:flutter/material.dart';
import '../service/database_service.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class SignUpViewModel with ChangeNotifier {
  final UserDTO _user = UserDTO(
      name: '', username: '', email: '', password: '', isOrganizer: false);
  final AuthenticationService service = AuthenticationService();
  List<String> errorMessages = [];

  UserDTO get name => _user;

  UserDTO get userName => _user;

  UserDTO get email => _user;

  UserDTO get password => _user;

  UserDTO get isOrganizer => _user;

  void setname(String name) {
    _user.name = name;
    notifyListeners();
  }

  void setUserName(String userName) {
    _user.username = userName;
    notifyListeners();
  }

  void setEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _user.password = password;
    notifyListeners();
  }

  void setOrganizer(bool organizer) {
    _user.isOrganizer = organizer;
    notifyListeners();
  }

  void navigateToSpecificHomeScreen(
      bool isOrganizerUser, BuildContext context) {
    if (isOrganizerUser) {
      Navigator.pushNamed(context, organizerHomeRoute);
    } else {
      Navigator.pushNamed(context, homeRoute);
    }
  }

  Future<void> register() async {
    try {
      await service.addUserToDatabase(_user);
      errorMessages.clear();
      notifyListeners();
    } catch (e) {
      errorMessages = [e.toString()];
      notifyListeners();
    }
  }

  String? validateName(String value) {
    if (value.isEmpty) {
      return mustEnterName;
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return mustEnterUsername;
    }
    return null;
  }

  String? validateEmail(String value) {
    if (!value.contains("@") && value.isNotEmpty) {
      return wrong_email;
    } else if (value.isEmpty) {
      return mustEnterEmail;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6 && value.isNotEmpty) {
      return validate_password;
    } else if (value.isEmpty) {
      return mustEnterPassword;
    }
    return null;
  }
}
