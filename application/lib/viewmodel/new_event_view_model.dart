import 'package:application/model/event_model.dart';
import 'package:flutter/material.dart';

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


  void setName(String name) {
    _event.name = name;
    notifyListeners();
  }

  void setAdress(String address) {
    _event.address = address;
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
