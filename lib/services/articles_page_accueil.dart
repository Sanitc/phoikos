import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/screen/article_screen.dart';
import 'package:phoikos/services/image_downloader.dart';

class LoadArticlesOfCategory extends StatefulWidget {
  //final String ;
  final String markerId;
  final ValueListenable<String> markerName;

  LoadArticlesOfCategory(this.markerName, this.markerId);

  @override
  _LoadArticlesOfCategoryState createState() => _LoadArticlesOfCategoryState();
}

class _LoadArticlesOfCategoryState extends State<LoadArticlesOfCategory> {
  @override
  void initState() {
    super.initState();
  }

  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    print("markerName articles page = ${widget.markerName}");
    print("markerID = ${widget.markerId}");

    return FutureBuilder(
        future: db
            .collection("category")
            .document(widget.markerId)
            .collection(widget.markerName.value)
            .getDocuments(), //db.collection("category").getDocuments(),
        builder: (context, snapshot) {
          //var querySnapshot = snapshot;

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<Article> articles = [];

            var querySnapshot = snapshot as AsyncSnapshot<QuerySnapshot>;

            querySnapshot.data.documents.forEach((element) {
              print("dans boucle");
              print("Article ${element.data}");
              //print('${element.documentID}');
              articles.add(Article.fromJSON(element.data));
            });

            return GridView.builder(
                //padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return new Card(
                    margin: EdgeInsets.all(15),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return ArticleScreenWidget(articles[index]);
                        }));
                      },
                      child: new GridTile(
                        footer: new Text(articles[index].name),
                        child: LoadFirebaseStorageImage(
                            articles[index].image, 10, 10, null),
                      ),
                    ),
                  );
                  /*ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[*/
                  /*GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: FittedBox(
                          child: Material(
                            //elevation: 14.0,
                            borderRadius: BorderRadius.circular(24.0),
                            shadowColor: Color(0xFFC7E2AC),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 250,
                                  height: 250,
                                  child: ClipRRect(
                                    borderRadius:
                                        new BorderRadius.circular(24.0),
                                    child: LoadFirebaseStorageImage(
                                        articles[index].image, 10, 10, null),
                                  ),
                                ),
                                Text(
                                  articles[index].name,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );*/
                  /*],
                  );*/

                  /*Expanded(
                    child: ListView(
                      children: <Widget>[
                        new Container(
                          child: new FlatButton(
                              /*onPressed: () => scaffoldKey.currentState.showSnackBar(
                                new SnackBar(
                                    content:
                                        new Text("You pressed Image No.$index"))),*/
                              child: LoadFirebaseStorageImage(
                                  articles[index].image, 10, 10, null)),
                          //width: 100.0,
                          //height: 100.0,
                        ),
                        Center(
                          child: Text(
                            articles[index].name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  );*/

                  /*FlatButton(
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                        LoadFirebaseStorageImage(
                            articles[index].image, 20, 20, null),
                        Center(
                          child: Text(
                            articles[index].name,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                    color: Color.fromRGBO(35, 66, 57, 0.94),
                  );*/
                });
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  _goToArticlePage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ArticleScreenWidget(article);
    }));
  }
}
