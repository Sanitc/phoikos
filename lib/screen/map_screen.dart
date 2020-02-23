import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenWidget extends StatefulWidget {
  @override
  _MapScreenWidgetState createState() => _MapScreenWidgetState();
}

class _MapScreenWidgetState extends State<MapScreenWidget> {
  Completer<GoogleMapController> _controller = Completer();

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 60,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: CameraPosition(target: LatLng(48.0973327, -1.6502198), zoom: 11.0),
          ),
        ),
      ),
    );
  }
}