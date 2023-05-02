import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../model/event_model.dart';
import '../model/marker_info_model.dart';
import '../service/event_database_service.dart';
import '../utils/text_strings.dart';
import 'package:geocoding/geocoding.dart';

class MapViewModel with ChangeNotifier {
  final double _initialZoomValue = 11.0;

  late LatLng _center = const LatLng(46.254633422682765, 20.157634687339225);
  late GoogleMapController mapController;
  final EventDatabaseService service = EventDatabaseService();
  List<String> errorMessages = [];

  Future<Set<MarkerInfoModel>> initializeMap() async {
    if (!(await isLocationPermitted())) {
      errorMessages.add(permissionErrorMessage);
    } else {
      errorMessages = [];
      await fetchCurrentLocation();
      Set<MarkerInfoModel> eventLocations = await fetchMarkersFromEventData();
      return eventLocations;
    }
    return <MarkerInfoModel>{};
  }

  Future<bool> isLocationPermitted() async {
    try {
      final permission = await Geolocator.checkPermission();
      return (permission != LocationPermission.denied &&
          permission != LocationPermission.deniedForever);
    } catch (e) {
      if (e.toString().isNotEmpty) {
        errorMessages = [e.toString()];
      } else {
        errorMessages = [standardErrorMessage];
      }
    }
    return false;
  }

  Future<void> fetchCurrentLocation() async {
    try {
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
      _center = LatLng(position.latitude, position.longitude);
    } catch (e) {
      if (e.toString().isNotEmpty) {
        errorMessages = [e.toString()];
      } else {
        errorMessages = [standardErrorMessage];
      }
    }
  }

  Future<Set<MarkerInfoModel>> fetchMarkersFromEventData() async {
    try {
      final eventModels = (await service.getEvents())
          .map((dto) => EventModel.fromDTO(dto))
          .toList();
      var futureList = eventModels.map((var eventData) async {
        final locations = await locationFromAddress(eventData.address);
        return MarkerInfoModel(
            eventData,
            LatLng(locations.first.latitude, locations.first.longitude));
      }).toSet();
      return (await Future.wait(futureList)).toSet();
    } catch (e) {
      if (e.toString().isNotEmpty) {
        errorMessages = [e.toString()];
      } else {
        errorMessages = [standardErrorMessage];
      }
    }
    return <MarkerInfoModel>{};
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  CameraPosition get initialCameraPosition => CameraPosition(
        target: _center,
        zoom: _initialZoomValue,
      );
}
