import 'package:flutter/material.dart';
import '../service/user_database_service.dart';
import '../utils/route_constants.dart';
import '../utils/text_strings.dart';

class MenuViewModel with ChangeNotifier {
  final UserDatabaseService service = UserDatabaseService();

  List<String> errorMessages = [];

  Future<void> logOutUser() async {
    try {
      await service.logOut();
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

  void navigateToProfile(BuildContext context) {
    Navigator.pushNamed(context, profileRoute);
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushNamed(context, homeRoute);
  }

  void navigateToParticipatedEvent(BuildContext context) {
    Navigator.pushNamed(context, participatedEventRoute);
  }

  void navigateToFavourites(BuildContext context) {
    Navigator.pushNamed(context, favouriteEventsRoute);
  }

  void navigateToNewEvent(BuildContext context) {
    Navigator.pushNamed(context, newEventRoute);
  }

  void navigateToCreatedEvent(BuildContext context) {
    Navigator.pushNamed(context, createdEventRoute);
  }

  void logOut(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName('/'));
    Navigator.pushNamed(context, startRoute);
  }
}
