import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/services/image_downloader.dart';

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class SearchPageWidget extends StatefulWidget {
  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 2));
    if (search == "empty") return [];
    if (search == "error") throw Error();
    return List.generate(search.length, (int index) {
      return Post(
        "$search",
        "le 0$index/0$index/2020",
      );
    });
  }

  final db = Firestore.instance;

  String markerName = "";
  String markerId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Rechercher',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(23, 69, 58, 0.81),
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
          child: FutureBuilder(
              future: db.collection("nouveaux_articles").getDocuments(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  List<Article> articles = [];

                  var querySnapshot = snapshot as AsyncSnapshot<QuerySnapshot>;

                  querySnapshot.data.documents.forEach((element) {
                    print("Nouvel article ${element.documentID}");
                    //print('${element.documentID}');
                    articles.add(Article.fromJSON(element.data));
                  });

                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SearchBar<Post>(
                        onSearch: search,
                        cancellationText: Text(
                          'Annuler',
                          style: TextStyle(color: Colors.white),
                        ),
                        searchBarStyle: SearchBarStyle(
                          backgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onError: (error) {
                          return Center(
                            child: Text(
                              "Aucun article, ne correspond à la recherche $error",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          );
                        },
                        minimumChars: 1,
                        onItemFound: (Post post, int index) {
                          return GestureDetector(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        width: 100,
                                        height: 100,
                                        child: ClipRRect(
                                          borderRadius:
                                              new BorderRadius.circular(8.0),
                                          child: LoadFirebaseStorageImage(
                                              articles[index].image,
                                              100,
                                              120,
                                              null),
                                        )),
                                    Expanded(
                                      child: ListTile(
                                        title: Text(
                                          articles[index].name,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              print("show article");
                            },
                          );
                        },
                      ),
                    ),
                  );
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }
}
