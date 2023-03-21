import 'package:application/model/event_model.dart';
import 'package:application/model/home_model.dart';
import 'package:flutter/material.dart';
import '../model/event_dto.dart';
import '../service/event_database_service.dart';
import '../utils/text_strings.dart';

class HomeViewModel with ChangeNotifier {
  HomeModel homeModel = HomeModel();

  final EventDatabaseService service = EventDatabaseService();

  List<String> errorMessages = [];


  HomeViewModel(){
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    try {
      final List<EventDTO> eventDTO = await service.getEvents();
      final List<EventModel> eventModel =
          eventDTO.map((dto) => EventModel.fromDTO(dto)).toList();
      homeModel.events = eventModel;
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
}
