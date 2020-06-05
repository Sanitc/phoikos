import 'package:flutter/material.dart';
import 'package:phoikos/screen/favorite_screen.dart';
import 'package:phoikos/screen/home_screen.dart';
import 'package:phoikos/screen/map_screen.dart';
import 'package:phoikos/screen/note_screen.dart';

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

  //final ArticleScreenWidget _articleScreenWidget = ArticleScreenWidget();

  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Color.fromRGBO(24, 76, 61, 0.7)),
        child: BottomNavigationBar(
          elevation: 8.0,
          selectedItemColor: Color.fromRGBO(228, 101, 76, 0.81),
          unselectedItemColor: Colors.white,
          currentIndex: _pageIndex,
          onTap: (value) {
            _pageIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border), title: Text('')),
            BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('')),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_florist), title: Text('')),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          _widgetWithOpacity(_pageIndex == 0, _homeScreenWidget),
          _widgetWithOpacity(_pageIndex == 1, _favoriteScreenWidget),
          _widgetWithOpacity(_pageIndex == 2, _mapScreenWidget),
          _widgetWithOpacity(_pageIndex == 3, _noteScreenWidget),
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
