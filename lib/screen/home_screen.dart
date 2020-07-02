import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/model/Category.dart';
import 'package:phoikos/page/category_page.dart';
import 'package:phoikos/services/image_downloader.dart';

import 'article_screen.dart';

//enum WidgetMarker { }

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final db = Firestore.instance;

  String markerName = "";
  String markerId = "";

  @override
  void initState() {
    db.collection('category').getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        return f.data['salle_de_bain'];
      });
    });

    /* markerName = "salle_de_bain";
    markerId = "JgW5ha79tm3UBI1r5MPm";
*/
    /*db
        .collection("category")
        .document("JgW5ha79tm3UBI1r5MPm")
        .collection("salle_de_bain")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        return f.data;
      });
    });*/

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Category category =
        Category("JgW5ha79tm3UBI1r5MPm", null, null, "salle_de_bain");

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(15.0),
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
        child: ListView(
          //column
          children: <Widget>[
            Align(
                alignment: Alignment.centerLeft,
                child: Text("Nouveaux articles !",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ))),
            //TODO affichage nouveaux articles
            Container(
              height: 150,
              child: getNewArticles(context),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("CATEGORIES",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )))),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: getChipCategoryName(context),
              ),
            ),
            //LoadArticlesOfCategory(markerName, markerId)
            //blockGetArticlesOfTheCategory(category))
            //Expanded(child: _categoryButtonView()), //LoadFirebaseStorageImage()
          ],
        ),
      ),
    );
  }

  /*blockGetArticlesOfTheCategory(Category category) {
    markerName = category.collection;
    markerId = category.id;

    LoadArticlesOfCategory(markerName, markerId);
  }*/

  Future getList() async {
    QuerySnapshot listArticles = await db
        .collection('category')
        .document('JgW5ha79tm3UBI1r5MPm')
        .collection('salle_de_bain')
        .getDocuments();
    return listArticles.documents;
  }

  Widget getNewArticles(BuildContext context) {
    return FutureBuilder(
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

            return ListView.builder(
                //padding: EdgeInsets.only(top: 20),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //    crossAxisCount: 3),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  /*Hero hero = Hero(
                    tag: articles[index].image,
                    child: LoadFirebaseStorageImage(
                        articles[index].image, 120, 120, null),
                  );*/
                  return Container(
                      width: 150,
                      child: Card(
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                            return ArticleScreenWidget(articles[index]);
                            /*HeroTry(
                                            articles: articles, index: index);*/
                          })),
                          child: GridTile(
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    child: LoadFirebaseStorageImage(
                                        articles[index].image, 100, 120, null),
                                  ),
                                  Text(articles[index].name),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ));
                });
          }
          return Center(child: CircularProgressIndicator());
        });
  }

  Widget _build(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _createNewArticles() {
    return Container(
        width: 100,
        height: 100,
        child: Column(
          //Card
          children: <Widget>[
            Expanded(
                child: LoadFirebaseStorageImage(
                    "categorie_salle_de_bain.jpg", 70, 70, "categorie")),
            Text(
              "oui",
              style:
                  DefaultTextStyle.of(context).style.apply(fontSizeFactor: 1),
            ),
          ],
        ));
  }

  FutureBuilder getChipCategoryName(BuildContext context) {
    return FutureBuilder(
      future: db.collection("category").getDocuments(),
      builder: (context, snapshot) {
        print('snapshot $snapshot');

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Category> categories = [];

          var querySnapshot = snapshot;

          querySnapshot.data.documents.forEach((element) {
            print('${element.data}');
            print('${element.documentID}');
            categories.add(Category.fromJSON(element.documentID, element.data));
            print("element.data ${element.data}");
          });

          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    child: Container(
                      height: 60,
                      child: Card(
                        color: Color.fromRGBO(115, 44, 30, 0.81),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(5),
                              height: 100,
                              width: 130,
                              child: Center(
                                child: Hero(
                                  tag: categories[i].name,
                                  child: Text(
                                    "${categories[i].name}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) =>
                              CategoryPageWidget(categories[i])));
                    },
                  );
                },
              ),
            ),
          );
          /*
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, i) {
              return InkWell(
                child: Container(
                  child: Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5),
                          height: 100,
                          width: 125,
                          child: Hero(
                            tag: categories[i].name,
                            child: Text("${categories[i].name}"),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoadArticlesOfCategory(
                          markerName, categories[i].id)));
                },
              );
            },
          );
          */

          /*
          return Wrap(
            spacing: 20,
            children: <Widget>[
              ActionChip(
                  label: Text(
                    categories[0].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
                  onPressed: () {
                    markerName = "${categories[0].collection}";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadArticlesOfCategory(
                                markerName, categories[0].id)));
                    //return LoadArticlesOfCategory(markerName, categories[0].id);
                    /*return LoadArticlesOfCategory(
                                categories[0].collection, categories[0].id);*/
                  }),
              ActionChip(
                  label: Text(
                    categories[1].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
                  onPressed: () {
                    markerName = "${categories[1].collection}";
                    print("$markerName");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadArticlesOfCategory(
                                markerName, categories[1].id)));
                    //return LoadArticlesOfCategory(markerName, categories[1].id);
                  }),
              ActionChip(
                  label: Text(
                    categories[2].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
                  onPressed: () {
                    markerName = "${categories[2].collection}";
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoadArticlesOfCategory(
                                markerName, categories[2].id)));
                    //return LoadArticlesOfCategory(markerName, categories[2].id);
                  }),
              ActionChip(
                  label: Text(
                    categories[3].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
                  onPressed: () {
                    markerName = "${categories[3].collection}";
                    return LoadArticlesOfCategory(markerName, categories[3].id);
                  }),
              ActionChip(
                  label: Text(
                    categories[4].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  backgroundColor: Color.fromRGBO(35, 66, 57, 0.94),
                  onPressed: () {
                    markerName = "${categories[4].collection}";
                    return LoadArticlesOfCategory(markerName, categories[4].id);
                  })
            ],
          );
          */
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _categoryButtonView() {
    return FutureBuilder(
      future: db.collection("category").getDocuments(),
      builder: (context, snapshot) {
        print('snapshot $snapshot');

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Category> categories = [];

          var querySnapshot = snapshot as AsyncSnapshot<QuerySnapshot>;

          querySnapshot.data.documents.forEach((element) {
            print('${element.data}');
            print('${element.documentID}');
            categories.add(Category.fromJSON(element.documentID, element.data));
          });

          return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Card(
                  child: GridTile(
                    child: Center(
                      child: Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

/*Widget _gridView() {
    return FutureBuilder(
      future: db.collection("category").getDocuments(),
      builder: (context, snapshot) {
        print('snapshot $snapshot');

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Category> categories = [];

          var querySnapshot = snapshot as AsyncSnapshot<QuerySnapshot>;

          querySnapshot.data.documents.forEach((element) {
            print('${element.data}');
            print('${element.documentID}');
            categories.add(Category.fromJSON(element.documentID, element.data));
          });

          return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CategoryPageWidget(categories[index]);
                      }));
                    },
                    child: GridTile(
                      header: Text(
                        categories[index].name,
                        textAlign: TextAlign.center,
                      ),
                      child: Center(
                        child: Text(categories[index].image),
                      ),
                      footer: Text(
                        categories[index].id,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10.0),
                      ),
                    ),
                  ),
                );
              });
        }
        return Center(child: CircularProgressIndicator());
      },
    );*/

/*FutureBuilder futureBuilderTest() {
      return FutureBuilder(
          future: getList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              print(snapshot.data.length);
              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return Card(
                      elevation: 8.0,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white)),
                      margin:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: SafeArea(
                          child: Column(
                            children: <Widget>[_createNewArticles()],
                          ),
                        ),
                      ));
                },
              );
            } else {
              return Text('non');
            }
          });
    }*/
}
