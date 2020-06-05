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
        backgroundColor: Color.fromRGBO(23, 69, 58, 0.81),
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
            stops: [0.1, 0.5, 0.9],
            colors: [
              Color.fromRGBO(23, 69, 58, 0.81),
              Color.fromRGBO(46, 137, 116, 0.81),
              Color.fromRGBO(65, 236, 133, 0.56)
            ],
          ),
        ),
      ),
    );
  }
}