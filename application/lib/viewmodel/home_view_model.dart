import 'package:application/model/event_model.dart';
import 'package:application/model/home_model.dart';
import 'package:flutter/material.dart';
import '../model/event_dto.dart';
import '../service/event_database_service.dart';

class HomeViewModel with ChangeNotifier {
  HomeModel homeModel = HomeModel();
  EventModel eventModel = EventModel(
      name: '',
      city: '',
      category: '',
      date: DateTime.now(),
      image: '',
      stuffLimit: 0,
      description: '');

  final EventDatabaseService service = EventDatabaseService();

  HomeModel getEvents() {
    return homeModel;
  }

  HomeViewModel() {
    fetchEvents();
  }

  setEventModel(EventDTO eventDTO) {
    eventModel = EventModel.fromDTO(eventDTO);
    notifyListeners();
  }

  Future<void> fetchEvents() async {
    try {
      final List<EventDTO> eventDTOs = await service.getEvents();
      final List<EventModel> eventModels =
          eventDTOs.map((dto) => EventModel.fromDTO(dto)).toList();
      homeModel.events = eventModels;
      notifyListeners();
    } catch (e) {
      // error handling
    }
  }
}
