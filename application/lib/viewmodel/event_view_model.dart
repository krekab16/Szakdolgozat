import 'package:application/model/event_dto.dart';
import 'package:flutter/widgets.dart';
import '../service/event_database_service.dart';
import '../utils/text_strings.dart';

class EventViewModel with ChangeNotifier {
  final EventDatabaseService service = EventDatabaseService();

  List<String> errorMessages = [];

  Future<void> addFavouriteEvent(EventDTO eventDTO) async {
    try {
      await service.addEventToFavorites(eventDTO);
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

  Future<void> removeFavouriteEvent(EventDTO eventDTO) async {
    try {
      await service.removeEventFromFavorites(eventDTO);
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

  Future<void> addParticipation(EventDTO eventDTO) async {
    try {
      await service.addParticipation(eventDTO);
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

  Future<void> removeParticipation(EventDTO eventDTO) async {
    try {
      await service.removeParticipation(eventDTO);
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




  void navigateBack(BuildContext context) {
    Navigator.pop(context);
  }
}
