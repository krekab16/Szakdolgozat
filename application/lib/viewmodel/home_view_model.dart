import 'package:application/model/event_model.dart';
import 'package:application/model/home_model.dart';
import 'package:flutter/material.dart';
import '../model/event_dto.dart';
import '../service/event_database_service.dart';

class HomeViewModel with ChangeNotifier {
  HomeModel homeModel = HomeModel();

  final EventDatabaseService service = EventDatabaseService();

  HomeViewModel(){
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final List<EventDTO> eventDTO = await service.getEvents();
      final List<EventModel> eventModel =
          eventDTO.map((dto) => EventModel.fromDTO(dto)).toList();
      homeModel.events = eventModel;
    } catch (e) {
      throw Exception(e);
    }
    notifyListeners();
  }

}
