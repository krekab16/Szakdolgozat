import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/user_database_service.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class LogInViewModel with ChangeNotifier {
  final UserModel _user = UserModel(
      name: '', username: '', email: '', password: '', isOrganizer: false);
  final UserDatabaseService service = UserDatabaseService();
  List<String> errorMessages = [];

  String getEmail() {
    return _user.email;
  }

  String getPassword() {
    return _user.password;
  }

  void setEmail(String email) {
    _user.email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _user.password = password;
    notifyListeners();
  }

  Future<void> login() async {
    try {
      await service.logInUser(_user.toDTO());
      errorMessages = [];
    } catch (e) {
      if (e.toString().isNotEmpty) {
        errorMessages = [e.toString()];
      } else {
        errorMessages = [standardErrorMessage];
      }
    }
    notifyListeners();
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homeRoute);
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return mustEnterEmailErrorMessage;
    } else if (!value.contains("@")) {
      return wrongEmailErrorMessage;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return mustEnterPasswordErrorMessage;
    } else if (value.length < 6) {
      return validatePasswordErrorMessage;
    }
    return null;
  }
}
