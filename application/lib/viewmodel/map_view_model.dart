import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../service/map_database_service.dart';
import '../utils/text_strings.dart';

class MapViewModel with ChangeNotifier {
  late GoogleMapController mapController;
  final double _initialZoomValue = 11.0;
  late LatLng _center = const LatLng(46.254633422682765, 20.157634687339225);
  Marker? _currentMarker;
  late Set<Marker> _markers = {};
  final MapDatabaseService service = MapDatabaseService();
  List<String> errorMessages = [];


  Future<void> getEventsAndShowOnMap() async {
    try {
      List<Map<String, dynamic>> eventDataList =
          await service.getEventDataFromAddress();
      _markers = eventDataList
          .map(
            (eventData) => Marker(
              markerId: MarkerId(eventData['eventName']),
              position: eventData['latLng'],
              infoWindow: InfoWindow(
                title: eventData['name'],
              ),
            ),
          )
          .toSet();
      notifyListeners();
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
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.deniedForever) {
        // Felhasználó megtagadta a jogosultságot
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
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
      }
    } catch (e) {
      if (e.toString().isNotEmpty) {
        errorMessages = [e.toString()];
      } else {
        errorMessages = [standardErrorMessage];
      }
    }
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  CameraPosition get initialCameraPosition => CameraPosition(
        target: _center,
        zoom: _initialZoomValue,
      );

  Set<Marker> get currentMarker {
    Set<Marker> markers = _markers;
    if (_currentMarker != null) {
      markers = markers..add(_currentMarker!);
    }
    return markers;
  }
}
