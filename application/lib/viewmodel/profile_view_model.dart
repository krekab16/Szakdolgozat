import 'package:application/model/user_model.dart';
import 'package:flutter/material.dart';
import '../model/user_dto.dart';
import '../service/user_database_service.dart';
import '../utils/text_strings.dart';

class ProfileViewModel with ChangeNotifier {
  final UserDatabaseService service = UserDatabaseService();

  UserModel userModel = UserModel.createEmpty();

  List<String> errorMessages = [];

  UserModel getProfile() {
    return userModel;
  }

  setUserModel(UserDTO user) {
    userModel = UserModel.fromDTO(user);
    notifyListeners();
  }

  Future<void> fetchUserProfile(UserModel userModel) async {
    try {
      final userProfile = await service.getUserProfile(userModel.toDTO());
      setUserModel(userProfile);
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

  Future<void> updateUser() async {
    try {
      await service.updateUserProfile(userModel.toDTO());
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
      return mustEnterNameErrorMessage;
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return mustEnterUsernameErrorMessage;
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
