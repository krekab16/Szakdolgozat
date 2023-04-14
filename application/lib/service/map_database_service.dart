import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapDatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> getEventDataFromAddress() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('events').get();
      if (querySnapshot.docs.isNotEmpty) {
        List<Map<String, dynamic>> eventList = [];
        for (var doc in querySnapshot.docs) {
          final data = doc.data() as Map<String, dynamic>;
          final String address = data['address'];
          String eventName = data['name'];
          List<Location> locations = await locationFromAddress(address);
          if (locations.isNotEmpty) {
            Location location = locations.first;
            LatLng latLng = LatLng(location.latitude, location.longitude);
            Map<String, dynamic> eventData = {
              'eventName': eventName,
              'latLng': latLng
            };
            eventList.add(eventData);
          }
        }
        return eventList;
      }
      return [];
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
