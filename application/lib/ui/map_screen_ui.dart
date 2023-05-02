import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../model/marker_info_model.dart';
import '../utils/colors.dart';
import '../utils/styles.dart';
import '../utils/text_strings.dart';
import '../viewmodel/map_view_model.dart';
import 'event_screen_ui.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Set<Marker> _allMarkers = <Marker>{};

  @override
  Widget build(BuildContext context) {
    final mapViewModel = Provider.of<MapViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.lightBlueColor,
        title: Text(
          map,
          style: Styles.textStyles,
        ),
      ),
      body: FutureBuilder<Set<MarkerInfoModel>>(
          future: mapViewModel.initializeMap(),
          builder: (BuildContext context,
              AsyncSnapshot<Set<MarkerInfoModel>> snapshot) {
            if (snapshot.hasData) {
              _allMarkers = snapshot.data?.map((markerInfo) =>
                  Marker(
                    onTap: () { Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventScreen(markerInfo.eventData))); },
                    markerId: MarkerId(markerInfo.eventData.id),
                    position: markerInfo.coordinate,
                    infoWindow: InfoWindow(title: markerInfo.eventData.name)
                  )).toSet() ?? <Marker>{};

              _allMarkers.add(Marker(
                markerId: MarkerId(currentPosition),
                position: mapViewModel.initialCameraPosition.target,
                infoWindow: InfoWindow(
                  title: currentPosition,
                ),
              ));

              return Stack(children: [
                if (mapViewModel.errorMessages.isNotEmpty) ...[
                  Text(mapViewModel.errorMessages.join(' ')),
                  TextButton(
                      onPressed: () async {
                        await Geolocator.requestPermission();
                      },
                      child: Text(locationGrantButtonText))
                ] else ...[
                  GoogleMap(
                    mapType: MapType.normal,
                    onMapCreated: mapViewModel.onMapCreated,
                    initialCameraPosition: mapViewModel.initialCameraPosition,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    markers: _allMarkers,
                  )
                ]
              ]);
            } else {
              return Text(loading);
            }
          }),
    );
  }
}
