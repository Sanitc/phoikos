import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

/// This Widget is the main application widget.
class Accueil extends StatelessWidget {
  static const String _title = 'Phoïkos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text('Phoïkos'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.green,
        backgroundColor: Colors.lightGreen,
        buttonBackgroundColor: Colors.white,
        height: 60,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.favorite_border, size: 20),
          Icon(Icons.map, size: 20),
          Icon(Icons.note, size: 20),
          Icon(Icons.tag_faces, size: 20),
        ],
        index: 0,
        onTap: (index) {},
      ),
      body: Container(color: Colors.lightGreen),
    );
  }
}
