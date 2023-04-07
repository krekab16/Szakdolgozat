import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/event_dto.dart';
import '../utils/text_strings.dart';

class EventDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<EventDTO>> getEvents() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('events').orderBy('date').get();
      final List<EventDTO> events =
          await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;
        return EventDTO.fromJson(data, doc.id);
      }).toList());
      return events;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> updateEvent(EventDTO eventDTO) async {
    try {
      await _firestore
          .collection('events')
          .doc(eventDTO.id)
          .update(eventDTO.toJson());
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> addParticipation(String userId, EventDTO eventDTO) async {
    try {
      final DocumentSnapshot docSnapshot =
          await _firestore.collection('events').doc(eventDTO.id).get();
      final int participationCount = docSnapshot.get('participationCount');
      final int stuffLimit = eventDTO.stuffLimit;

      if (participationCount < stuffLimit) {
        await _firestore.collection('events').doc(eventDTO.id).update({
          'participationCount': FieldValue.increment(1),
          'participants': FieldValue.arrayUnion([userId]),
        });
      } else {
        throw Exception(participationErrorMessage);
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> removeParticipation(String userId, EventDTO eventDTO) async {
    try {
      final DocumentSnapshot docSnapshot =
          await _firestore.collection('events').doc(eventDTO.id).get();

      if (userId.isNotEmpty &&
          docSnapshot.get('participants').contains(userId)) {
        await _firestore.collection('events').doc(eventDTO.id).update({
          'participationCount': FieldValue.increment(-1),
          'participants': FieldValue.arrayRemove([userId])
        });
      } else {
        throw Exception(currentUserNotParticipatingErrorMessage);
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<EventDTO>> getFavouriteEvent(String userId) async {
    try {
      final DocumentSnapshot snapshot =
          await _firestore.collection('users').doc(userId).get();

      final Map<String, dynamic>? data =
          snapshot.data() as Map<String, dynamic>?;
      final List<dynamic> favorites = data?['favorites'] ?? [];
      final QuerySnapshot querySnapshot = await _firestore
          .collection('events')
          .where(FieldPath.documentId, whereIn: favorites)
          .get();

      final List<EventDTO> events =
          await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;
        return EventDTO.fromJson(data, doc.id);
      }).toList());

      return events;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<EventDTO>> getParticipatedEvent(String userId) async {
    try {
      final QuerySnapshot querySnapshot = await _firestore
          .collection('events')
          .where('participants', arrayContains: userId)
          .get();

      final List<EventDTO> events =
          await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;
        return EventDTO.fromJson(data, doc.id);
      }).toList());

      return events;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
