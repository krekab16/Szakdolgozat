import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import '../model/event_dto.dart';
import '../model/event_model.dart';
import '../service/event_database_service.dart';
import '../ui/event_screen_ui.dart';
import '../utils/text_strings.dart';
import 'package:geocoding/geocoding.dart';

class MapViewModel with ChangeNotifier {
  late GoogleMapController mapController;
  final double _initialZoomValue = 11.0;
  late LatLng _center = const LatLng(46.254633422682765, 20.157634687339225);
  Marker? _currentMarker;
  late Set<Marker> _markers = {};
  final EventDatabaseService service = EventDatabaseService();
  List<String> errorMessages = [];

  Future<void> requestLocationPermission(BuildContext context) async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      while (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Figyelem!'),
            content: Text(
                'Ha szeretné a térképen megtekinteni az eseményeket, kérem engedélyezze a helymeghatározást.'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await Geolocator.requestPermission();
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        await getCurrentLocation();
      }

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

  Future<void> getCurrentLocation() async {
    try {
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

  Future<void> fetchMarkersFromEventData(BuildContext context) async {
    try {
      final List<EventDTO> eventDTO = await service.getEvents();
      final List<EventModel> eventModels =
          eventDTO.map((dto) => EventModel.fromDTO(dto)).toList();
      Iterable<Future<Marker>> futureList =
          eventModels.map((EventModel eventData) async {
        List<Location> locations = await locationFromAddress(eventData.address);
        LatLng latLng =
            LatLng(locations.first.latitude, locations.first.longitude);
        return Marker(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EventScreen(eventData),
              ),
            );
          },
          markerId: MarkerId(eventData.id),
          position: latLng,
          infoWindow: InfoWindow(
            title: eventData.name,
          ),
        );
      }).toSet();
      _markers = (await Future.wait(futureList)).toSet();
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
    if (_currentMarker != null) {
      _markers = _markers..add(_currentMarker!);
    }
    return _markers;
  }
}