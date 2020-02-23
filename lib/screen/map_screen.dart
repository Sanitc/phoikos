import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenWidget extends StatefulWidget {
  @override
  _MapScreenWidgetState createState() => _MapScreenWidgetState();
}

class _MapScreenWidgetState extends State<MapScreenWidget> with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _completerController = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Marker _selectedMarker;

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _initDefaultMarker();
    _initAnimation();
  }

  _initAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    _offsetAnimation = Tween<Offset>(
      end: Offset.zero,
      begin: const Offset(1.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));
  }

  _initDefaultMarker() {
    MarkerId id = MarkerId('Here something !');
    Marker marker = Marker(
      markerId: id,
      position: LatLng(48.1168918, -1.68135),
      onTap: () {
        print('marker tapped ');
        setState(() {
          _selectedMarker = markers[id];
        });
        _controller.forward();
      },
    );
    markers[id] = marker;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onTap: (position) {
              _controller.reverse();

              Future.delayed(Duration(milliseconds: 2000), () {
                setState(() {
                  _selectedMarker = null;
                });
              });
            },
            onMapCreated: (GoogleMapController controller) {
              _completerController.complete(controller);
            },
            initialCameraPosition: CameraPosition(target: LatLng(48.0973327, -1.6502198), zoom: 11.0),
            markers: Set<Marker>.of(markers.values),
          ),
          _selectedMarker != null
              ? Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: new Offset(2.0, 2.0),
                          )
                        ],
                      ),
                      height: 120.0,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
