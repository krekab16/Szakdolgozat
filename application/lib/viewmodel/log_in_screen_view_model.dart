import 'package:flutter/material.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class LogInViewModel with ChangeNotifier {
  void navigateToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, homeRoute);
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return mustEnterEmail;
    } else if (!value.contains("@")) {
      return wrong_email;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return mustEnterPassword;
    } else if (value.length < 6) {
      return validate_password;
    }
    return null;
  }
}
