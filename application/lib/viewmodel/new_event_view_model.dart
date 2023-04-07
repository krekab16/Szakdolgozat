import 'package:application/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventScreenViewModel with ChangeNotifier {
  final EventModel _event = EventModel.createEmpty();

  final List<String> categories = [
    'Sport',
    'Művészet',
    'Zene',
    'Divat',
    'Technológia',
    'Gasztronómia',
    'Család',
    'Politika',
    'Kultúra'
  ];

  String getName() {
    return _event.name;
  }

  String getCity() {
    return _event.city;
  }

  String? getStreet() {
    return _event.street;
  }

  int? getHouseNumber() {
    return _event.houseNumber;
  }

  String getCategory() {
    return _event.category;
  }

  DateTime getDate() {
    return _event.date;
  }

  String getImage() {
    return _event.image;
  }

  int getStuffLimit() {
    return _event.stuffLimit;
  }

  String getDescription() {
    return _event.description;
  }

  void setName(String name) {
    _event.name = name;
    notifyListeners();
  }

  void setCity(String city) {
    _event.city = city;
    notifyListeners();
  }

  void setStreet(String street) {
    _event.street = street;
    notifyListeners();
  }

  void setHouseNumber(int houseNumber) {
    _event.houseNumber = houseNumber;
    notifyListeners();
  }

  void setCategory(String category) {
    _event.category = category;
    notifyListeners();
  }

  void setDate(DateTime date) {
    _event.date = date;
    notifyListeners();
  }

  void setStuffLimit(int stuffLimit) {
    _event.stuffLimit = stuffLimit;
    notifyListeners();
  }

  void setImage(String image) {
    _event.image = image;
    notifyListeners();
  }

  void setDescription(String description) {
    _event.description = description;
    notifyListeners();
  }
}
