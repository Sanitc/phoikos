import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/model/Category.dart';
import 'package:phoikos/services/articles_page_accueil.dart';
import 'package:phoikos/services/image_downloader.dart';

//enum WidgetMarker { }

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final db = Firestore.instance;

  final markerName = new ValueNotifier("salle_de_bain");
  final markerId = new ValueNotifier("JgW5ha79tm3UBI1r5MPm");

  @override
  void initState() {
    db.collection('category').getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        return f.data['salle_de_bain'];
      });
    });

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
        padding: const EdgeInsets.all(15.0),
        //height: 800,
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
        child: Column(
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
            /*Container(
              child: getNewArticles(context),
            ),*/
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
            LoadArticlesOfCategory(markerName, category.id)
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
                //scrollDirection: Axis.horizontal,
                //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //    crossAxisCount: 3),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 20,
                    child: Card(
                      //margin: EdgeInsets.all(15),
                      child: InkWell(
                        //onTap: ,
                        child: new GridTile(
                          footer: new Text(articles[index].name),
                          child: LoadFirebaseStorageImage(
                              articles[index].image, 10, 10, null),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Center(child: CircularProgressIndicator());
        });
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
          return ValueListenableBuilder<String>(
            valueListenable: markerName,
            builder: (context, value, child) {
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
                        markerName.value = "${categories[0].collection}";
                        LoadArticlesOfCategory(markerName, categories[0].id);
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
                        markerName.value = "${categories[1].collection}";
                        LoadArticlesOfCategory(markerName, categories[1].id);
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
                        markerName.value = "${categories[2].collection}";
                        LoadArticlesOfCategory(markerName, categories[2].id);
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
                        markerName.value = "${categories[3].collection}";
                        LoadArticlesOfCategory(markerName, categories[3].id);
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
                        markerName.value = "${categories[4].collection}";
                        LoadArticlesOfCategory(markerName, categories[4].id);
                      })
                ],
              );
            },
          );
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
