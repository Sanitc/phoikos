import 'package:flutter/material.dart';

class ProfilePagePageWidget extends StatefulWidget {
  @override
  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePagePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Color(0xFF90AB77),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('click on search');
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3FFC7),
              Color(0xFFC7E2AC),
              Color(0xFFABC691),
              Color(0xFF90AB77),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
      ),
    );
  }
}
