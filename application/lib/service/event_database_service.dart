import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/event_dto.dart';
import '../utils/text_strings.dart';

class EventDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<List<EventDTO>> getEvents() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('events').orderBy('date').get();
      final List<EventDTO> events =
          await Future.wait(querySnapshot.docs.map((doc) async {
        final data = doc.data() as Map<String, dynamic>;
        final String imageDownloadUrl = data['image'];
        return EventDTO.fromJson(data, imageDownloadUrl, doc.id);
      }).toList());
      return events;
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> addEventToFavorites(EventDTO eventDTO) async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      final DocumentReference docRef =
          _firestore.collection('users').doc(currentUser?.uid);
      await docRef.update({
        'favorites': FieldValue.arrayUnion([eventDTO.id])
      });
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removeEventFromFavorites(EventDTO eventDTO) async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;
      final DocumentReference docRef =
          _firestore.collection('users').doc(currentUser?.uid);
      await docRef.update({
        'favorites': FieldValue.arrayRemove([eventDTO.id])
      });
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> addParticipation(EventDTO eventDTO) async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;

      final DocumentSnapshot docSnapshot =
          await _firestore.collection('events').doc(eventDTO.id).get();
      final int participationCount = docSnapshot.get('participationCount');
      final int stuffLimit = eventDTO.stuffLimit;

      if (participationCount < stuffLimit) {
        await _firestore.collection('users').doc(currentUser?.uid).update({
          'participate': FieldValue.arrayUnion([eventDTO.id]),
        });
        await _firestore.collection('events').doc(eventDTO.id).update({
          'participationCount': FieldValue.increment(1),
          'participants': FieldValue.arrayUnion([currentUser?.uid]),
        });
      } else {
        throw Exception(participationErrorMessage);
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> removeParticipation(EventDTO eventDTO) async {
    try {
      final User? currentUser = _firebaseAuth.currentUser;

      final DocumentSnapshot docSnapshot =
          await _firestore.collection('events').doc(eventDTO.id).get();

      if (currentUser != null &&
          docSnapshot.get('participants').contains(currentUser.uid)) {
        await _firestore.collection('users').doc(currentUser.uid).update({
          'participate': FieldValue.arrayRemove([eventDTO.id]),
        });
        await _firestore.collection('events').doc(eventDTO.id).update({
          'participationCount': FieldValue.increment(-1),
          'participants': FieldValue.arrayRemove([currentUser.uid])
        });
      } else {
        throw Exception('The current user is not participating in the event');
      }
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
