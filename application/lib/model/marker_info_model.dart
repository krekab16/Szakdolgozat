import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'event_model.dart';

class MarkerInfoModel {
  EventModel eventData = EventModel.createEmpty();
  LatLng coordinate = const LatLng(0, 0);

  MarkerInfoModel(this.eventData, this.coordinate);
}