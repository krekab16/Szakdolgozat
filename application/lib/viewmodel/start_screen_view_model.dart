import 'package:flutter/material.dart';

class StartViewModel with ChangeNotifier {
  void navigateToSignUp(BuildContext context) {
    Navigator.pushNamed(context, '/signup');
  }

  void navigateToLogIn(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }
}
