import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViewModel with ChangeNotifier {
  late GoogleMapController mapController;
  final double _initialZoomValue = 11.0;
  late final LatLng _center = const LatLng(46.254633422682765, 20.157634687339225);


  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  CameraPosition get initialCameraPosition => CameraPosition(
        target: _center,
        zoom: _initialZoomValue,
      );
}
