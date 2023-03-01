import 'package:flutter/material.dart';
import '../utils/route_constants.dart';

class SignUpViewModel with ChangeNotifier {
  void NavigateToSpecificHomeScreen(
      bool isOrganizerUser, BuildContext context) {
    if (isOrganizerUser) {
      Navigator.pushNamed(context, organizerHomeRoute);
    } else {
      Navigator.pushNamed(context, homeRoute);
    }
  }
}
