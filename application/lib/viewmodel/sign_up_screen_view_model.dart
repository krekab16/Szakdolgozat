import 'dart:core';
import 'package:application/model/user_model.dart';
import 'package:flutter/material.dart';
import '../service/user_database_service.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class SignUpViewModel with ChangeNotifier {

  final UserModel _user = UserModel(
      name: '',
      username: '',
      email: '',
      password: '',
      isOrganizer: false);

  final UserDatabaseService service = UserDatabaseService();

  List<String> errorMessages = [];

  String getName() {
    return _user.name;
  }

  String getEmail() {
    return _user.email;
  }

  String getPassword() {
    return _user.password;
  }

  bool getIsOrganizer() {
    return _user.isOrganizer;
  }

  void setName(String name) {
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

  void navigateToHomeScreen(BuildContext context) {
    Navigator.pushNamed(context, homeRoute);
  }

  Future<void> register() async {
    try {
      await service.addUserToDatabase(_user.toDTO());
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
