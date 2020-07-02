import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/screen/article_screen.dart';
import 'package:phoikos/services/image_downloader.dart';

class LoadArticlesOfCategory extends StatefulWidget {
  //final String ;
  //final String markerId;
  //final ValueListenable<String> markerName;

  final markerId;
  final markerName;

  LoadArticlesOfCategory(this.markerName, this.markerId);

  @override
  _LoadArticlesOfCategoryState createState() => _LoadArticlesOfCategoryState();
}

class _LoadArticlesOfCategoryState extends State<LoadArticlesOfCategory> {
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    print("markerName articles page = ${widget.markerName}");
    print("markerID = ${widget.markerId}");

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.markerName),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(23, 69, 58, 0.81),
      ),
      body: FutureBuilder(
          future: db
              .collection("category")
              .document(widget.markerId)
              .collection(widget.markerName)
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

              return ListView.separated(
                padding: EdgeInsets.only(top: 20),
                //cacheExtent: 100.0,
                shrinkWrap: true,
                itemCount: articles.length,
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
                              borderRadius: new BorderRadius.circular(8.0),
                              child: LoadFirebaseStorageImage(
                                  articles[index].image, 10, 10, null),

                              /*Hero(
                                tag: "un tag",
                                child: LoadFirebaseStorageImage(
                              )),*/
                            )),
                        Expanded(
                          child: ListTile(
                              title: new Text(
                            articles[index].name,
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ArticleScreenWidget(articles[index]);
                      }));
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  _goToArticlePage(Article article) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ArticleScreenWidget(article);
    }));
  }
}
