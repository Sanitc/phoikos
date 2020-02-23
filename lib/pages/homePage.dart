import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoikos/pages/pageAccueil.dart';
import 'package:phoikos/pages/pageFavoris.dart';
import 'package:phoikos/pages/pageMap.dart';
import 'package:phoikos/pages/pageNotes.dart';
import 'package:phoikos/pages/pageProfil.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  final PageAccueil _pageAccueil = PageAccueil();
  final PageFavoris _pageFavoris = PageFavoris();
  final PageMap _pageMap = PageMap();
  final PageNotes _pageNotes = PageNotes();
  final PageProfil _pageProfil = PageProfil();

  Widget _showPage = new PageAccueil();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _pageAccueil;
        break;

      case 1:
        return _pageFavoris;
        break;

      case 2:
        return _pageMap;
        break;

      case 3:
        return _pageNotes;
        break;

      case 4:
        return _pageProfil;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.favorite_border, size: 20),
          Icon(Icons.map, size: 20),
          Icon(Icons.note, size: 20),
          Icon(Icons.tag_faces, size: 20),
        ],
        color: Color(0xFFFFFFE3),
        backgroundColor: Color(0xFF90AB77),
        buttonBackgroundColor: Color(0xFFFFFFE3),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
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
