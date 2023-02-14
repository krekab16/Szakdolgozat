import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier {
  bool navigateToAdminHome = false;
  bool navigateToHome = false;
  
  void choice(bool value) {
    if (value) {
      navigateToAdminHome = true;
      navigateToHome = false;
    } else {
      navigateToAdminHome = false;
      navigateToHome = true;
    }
  }
}
