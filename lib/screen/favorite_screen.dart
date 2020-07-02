import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage("assets/images/background/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            // top container
            new Expanded(
              child: _getChipCategoryName(), // todo, add the two texts,
            ),

            // bottom container
            new Container(
              height: 480.0, // this needs to be 60% of the page
              child: _getArticlesOfTheCategory(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _getArticlesOfTheCategory() {
  return ListView.separated(
    padding: EdgeInsets.only(top: 1),
    cacheExtent: 100.0,
    shrinkWrap: true,
    itemCount: 10,
    itemBuilder: (context, index) {
      return GestureDetector(
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 10,
            ),
            Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(14.0),
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/logo/logo_Biocoop.png'),
                ),
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  "Nom article",
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  "dd/mm/aaaa",
                  style: TextStyle(color: Colors.white),
                ),
                isThreeLine: true,
                trailing: Icon(
                  Icons.favorite,
                  color: Color.fromRGBO(228, 101, 76, 0.81),
                ),
              ),
            )
          ],
        ),
        onTap: () {
          print("show article");
        },
      );
    },
    separatorBuilder: (context, index) {
      return Divider();
    },
  );
}

Widget _getChipCategoryName() {
  return Wrap(
    spacing: 5,
    children: <Widget>[
      ActionChip(
          label: Text(
            "Maison",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
          onPressed: () {
            return null;
          }),
      ActionChip(
          label: Text(
            "Jardin",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
          onPressed: () {
            return null;
          }),
      ActionChip(
          label: Text(
            "Alimentation",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
          onPressed: () {
            return null;
          }),
      ActionChip(
          label: Text(
            "Vêtement",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
          onPressed: () {
            return null;
          })
    ],
  );
}
