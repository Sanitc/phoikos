import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/screen/favorite_screen.dart';
import 'package:phoikos/screen/home_screen.dart';
import 'package:phoikos/screen/map_screen.dart';
import 'package:phoikos/screen/note_screen.dart';
import 'package:phoikos/screen/profile_screen.dart';
import 'package:phoikos/utils/colors.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final GlobalKey _bottomNavigationKey = GlobalKey();

  final HomeScreenWidget _homeScreenWidget = HomeScreenWidget();
  final FavoriteScreenWidget _favoriteScreenWidget = FavoriteScreenWidget();
  final MapScreenWidget _mapScreenWidget = MapScreenWidget();
  final NoteScreenWidget _noteScreenWidget = NoteScreenWidget();
  final ProfileScreenWidget _profileScreenWidget = ProfileScreenWidget();

  //final ArticleScreenWidget _articleScreenWidget = ArticleScreenWidget();

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _pageIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 20),
          Icon(Icons.favorite_border, size: 20),
          Icon(Icons.map, size: 20),
          Icon(Icons.note, size: 20),
          Icon(Icons.tag_faces, size: 20),
        ],
        color: PColors.paleGreen,
        backgroundColor: Color(0xFF90AB77),
        buttonBackgroundColor: Color(0xFFFFFFE3),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: (int index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: Stack(
        children: <Widget>[
          _widgetWithOpacity(_pageIndex == 0, _homeScreenWidget),
          _widgetWithOpacity(_pageIndex == 1, _favoriteScreenWidget),
          _widgetWithOpacity(_pageIndex == 2, _mapScreenWidget),
          _widgetWithOpacity(_pageIndex == 3, _noteScreenWidget),
          _widgetWithOpacity(_pageIndex == 4, _profileScreenWidget),
        ],
      ),
    );
  }

  Widget _widgetWithOpacity(bool visible, Widget child) {
    return IgnorePointer(
      ignoring: !visible,
      child: Opacity(
        opacity: visible ? 1.0 : 0.0,
        child: child,
      ),
    );
  }
}
