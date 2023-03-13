import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../service/user_database_service.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class LogInViewModel with ChangeNotifier {
  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homeRoute);
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
