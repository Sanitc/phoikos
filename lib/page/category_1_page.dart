import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/screen/article_screen.dart';

class Category1PageWidget extends StatefulWidget {
  @override
  _Category1PageWidgetState createState() => _Category1PageWidgetState();
}

class _Category1PageWidgetState extends State<Category1PageWidget> {
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();

    for (int i = 1; i < 11; i++) {
      _articles.add(Article(i, 'Article ' + '$i',
          'assets/images/categories/image_' + '$i' + '.jpg'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category 1",
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Color(0xFF90AB77),
        //automaticallyImplyLeading: false,
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
        padding: const EdgeInsets.all(15.0),
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
        child: Column(
          children: <Widget>[
            //Image.asset('assets/images/categories/image_1.jpg'),
            /*Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Divider(
                  color: Colors.black,
                )),*/
            Expanded(child: _gridView()),
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      itemCount: _articles.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        //return _categoryWidgetFromModel(_categories[index]);
        return new GestureDetector(
            child: new Card(
                elevation: 5.0,
                child: new Container(
                  alignment: Alignment.centerLeft,
                  margin: new EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(_articles[index].name),
                      Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Image.asset(_articles[index].image,
                              width: 200, height: 100)),
                    ],
                  ),
                )),
            onTap: () {
              /*CachedNetworkImage(
                imageUrl: 'https://picsum.photos/250?image=9',
              );*/
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ArticleScreenWidget()),
              );
            });
      },
    );
  }
}
