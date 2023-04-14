import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:application/model/event_model.dart';
import 'package:geolocator/geolocator.dart';
import '../service/map_database_service.dart';
import '../utils/text_strings.dart';

class MapViewModel with ChangeNotifier {
  late GoogleMapController mapController;
  final double _initialZoomValue = 11.0;
  late LatLng _center = const LatLng(46.254633422682765, 20.157634687339225);
  late Marker _currentMarker;
  late Set<Marker> _markers = {};

  final MapDatabaseService service = MapDatabaseService();
  List<String> errorMessages = [];

  EventModel eventModel = EventModel.createEmpty();

  MapViewModel() {
    getCurrentLocation();
    getEventsAndShowOnMap();
  }

  Future<void> getEventsAndShowOnMap() async {
    try {
      List<Map<String, dynamic>> eventDataList =
          await service.getEventDataFromAddress();
      _markers = eventDataList
          .map(
            (eventData) => Marker(
              markerId: MarkerId(eventModel.id),
              position: eventData['latLng'],
              infoWindow: InfoWindow(
                title: eventModel.name,
              ),
            ),
          )
          .toSet();
    } catch (e) {
      if (e.toString().isNotEmpty) {
        errorMessages = [e.toString()];
      } else {
        errorMessages = [standardErrorMessage];
      }
    }
    notifyListeners();
  }

  Future<void> getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    _center = LatLng(position.latitude, position.longitude);
    _currentMarker = Marker(
      markerId: MarkerId(currentPosition),
      position: _center,
      infoWindow: InfoWindow(
        title: currentPosition,
      ),
    );
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  CameraPosition get initialCameraPosition => CameraPosition(
        target: _center,
        zoom: _initialZoomValue,
      );

  Set<Marker> get currentMarker => _markers..add(_currentMarker);
}
