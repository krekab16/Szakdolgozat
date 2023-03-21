import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/event_dto.dart';

class EventDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<EventDTO>> getEvents() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('events').get();
      final List<EventDTO> events =
          await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;
        final String imageDownloadUrl = data['image'];
        return EventDTO.fromJson(data, imageDownloadUrl);
      }).toList());
      return events;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
