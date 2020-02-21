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
          color: Colors.lightGreen,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.lightGreen,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 300),
          onTap: (int tappedIndex) {
            setState(() {
              _showPage = _pageChooser(tappedIndex);
            });
          },
        ),
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              children: <Widget>[
                _showPage,
              ],
            ),
          ),
        ));
  }
}
