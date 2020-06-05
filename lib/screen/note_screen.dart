import 'package:flutter/material.dart';
import 'package:phoikos/page/phoikos_team_page.dart';
import 'package:phoikos/page/profile_page.dart';

class NoteScreenWidget extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Color(0xFF90AB77),
        automaticallyImplyLeading: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('click on search');
            },
          )
        ],
      ),
      drawer: Container(
        width: 180,
        child: Drawer(
          child: Container(
            color: Color(0xFF90AB77),
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.arrow_back, color: Colors.white),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                    title: Text(
                      'Nos partenaires',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    }),
                ListTile(
                    title: Text(
                      'La team Phoïkos',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return PhoikosTeamPagePageWidget();
                      }));
                    }),
                ListTile(
                    title: Text(
                      'Mon profil',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProfilePagePageWidget();
                      }));
                    })
              ],
            ),
          ),
        ),
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
