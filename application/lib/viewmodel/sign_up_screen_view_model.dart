import 'package:application/model/user_model.dart';
import 'package:flutter/material.dart';
import '../service/database_service.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class SignUpViewModel with ChangeNotifier {
  final UserModel _user = UserModel();
  final AuthenticationService service = AuthenticationService();
  List<String> error_messeges = List.empty();

  UserModel get name => _user;

  UserModel get userName => _user;

  UserModel get email => _user;

  UserModel get password => _user;

  UserModel get organizer => _user;

  void setname(String name) {
    _user.name = name;
    notifyListeners();
  }

  void setUserName(String userName) {
    _user.userName = userName;
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
    _user.organizer = organizer;
    notifyListeners();
  }

  void NavigateToSpecificHomeScreen(
      bool isOrganizerUser, BuildContext context) {
    if (isOrganizerUser) {
      Navigator.pushNamed(context, organizerHomeRoute);
    } else {
      Navigator.pushNamed(context, homeRoute);
    }
  }

  Future<void> register() async {
    try {
      await service.registerUser(_user);
    } catch (e) {
      error_messeges.add(e.toString());
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
