import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenWidget extends StatefulWidget {
  @override
  _MapScreenWidgetState createState() => _MapScreenWidgetState();
}

class _MapScreenWidgetState extends State<MapScreenWidget>
    with SingleTickerProviderStateMixin {
  final db = Firestore.instance;
  final Completer<GoogleMapController> _completerController = Completer();

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  Marker _selectedMarker;

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  List<Marker> allMarkers = [];
  setMarkers() {
    return allMarkers;
  }

  @override
  void initState() {
    super.initState();
    //_initDefaultMarker();
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

  Widget loadMarkers() {
    return StreamBuilder(
      stream: Firestore.instance.collection('markers').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return Text('Loading maps..Please wait');
        for (int i = 0; i < snapshot.data.documents.length; i++) {
          allMarkers.add(
            new Marker(
              markerId:
                  MarkerId(db.collection('markers').document().documentID),
              draggable: false,
              position: LatLng(snapshot.data.documents[i]['coords'].latitude,
                  snapshot.data.documents[i]['coords'].longitude),
              infoWindow: InfoWindow(
                  title: snapshot.data.documents[i]['place'],
                  snippet: snapshot.data.documents[i]['adress']),
              onTap: () {
                print(db.collection('markers').document().documentID);
                print(snapshot.data.documents[i]['place']);
              },
            ),
          );
        }
        return GoogleMap(
          rotateGesturesEnabled: false,
          scrollGesturesEnabled: true,
          tiltGesturesEnabled: false,
          zoomGesturesEnabled: true,
          zoomControlsEnabled: false,
          mapToolbarEnabled: false,
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
          initialCameraPosition: CameraPosition(
              target: LatLng(48.1146285, -1.6796229), zoom: 11.0),
          markers: Set.from(allMarkers),
        );
      },
    );
  }

  /*_initDefaultMarker() {
    MarkerId id = MarkerId('Here something !');

    Marker marker = Marker(
      markerId: id,
      position: LatLng(48.1508, -1.6871),
      onTap: () {
        print('marker tapped ');
        setState(() {
          _selectedMarker = markers[id];
        });
        _controller.forward();
      },
    );
    markers[id] = marker;
  }*/

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          loadMarkers(),
          _selectedMarker != null
              ? Positioned(
                  bottom: 16.0,
                  left: 16.0,
                  right: 16.0,
                  child: SlideTransition(
                    position: _offsetAnimation,
                    child: FittedBox(
                      child: Material(
                        color: Color.fromRGBO(228, 101, 76, 0.75),
                        elevation: 14.0,
                        borderRadius: BorderRadius.circular(14.0),
                        shadowColor: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 180,
                              height: 200,
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(14.0),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                      'assets/images/logo/logo_Biocoop.png'),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: myDetailContainer(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}

Widget myDetailContainer() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          child: Text(
            'Biocoop Scarabée St Grégoire',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "Adresse : 8 Rue de la Cerisaie, 35760 Saint-Grégoire",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      )),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "Téléphone : 02 99 87 14 14 ",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      )),
      SizedBox(height: 5.0),
      Container(
          child: Text(
        "Site Web : scarabee-biocoop.fr",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      )),
    ],
  );
}
