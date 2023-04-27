import 'package:flutter/material.dart';

class NewEventScreenViewModel with ChangeNotifier {

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
}
