import 'package:flutter/material.dart';
import '../utils/route_constants.dart';

class MenuViewModel with ChangeNotifier {

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
