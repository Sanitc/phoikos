import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Category.dart';
import 'package:phoikos/page/category_page.dart';
import 'package:phoikos/services/image_downloader.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final db = Firestore.instance;

  @override
  void initState() {
    db.collection('category').getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents
          .forEach((f) => print('${f.data}')); //y avait un } en plus
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Phoïkos',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Color(0xFF5a9216), //0xFF90AB77
        automaticallyImplyLeading: false,
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
        height: 800,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFbef67a), //0xFFE3FFC7
              Color(0xFF8bc34a), //0xFFC7E2AC
              //Color(0xFF8bc34a), //0xFFABC691
              Color(0xFF5a9216), //0xFF90AB77
            ],
            stops: [0.1, 0.4, 0.9],
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
            Container(
                height: 170,
                child: ListView(
                    //builder
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      _createNewArticles(),
                      _createNewArticles(),
                      _createNewArticles(),
                      _createNewArticles(),
                      _createNewArticles(),
                      _createNewArticles(),
                      _createNewArticles(),
                      _createNewArticles()
                    ])),
            Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("CATEGORIES",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        )))),
            Align(
              alignment: Alignment.centerLeft,
              child: getChipCategoryName(context),
            ),
            //Expanded(child: _categoryButtonView()), //LoadFirebaseStorageImage()
          ],
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

  Widget getChipCategoryName(BuildContext context) {
    return FutureBuilder(
      future: db.collection("category").getDocuments(),
      builder: (context, snapshot) {
        print('snapshot ${snapshot}');

        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          List<Category> categories = [];

          var querySnapshot = snapshot as AsyncSnapshot<QuerySnapshot>;

          querySnapshot.data.documents.forEach((element) {
            print('${element.data}');
            print('${element.documentID}');
            categories.add(Category.fromJSON(element.documentID, element.data));
          });
          return //Wrap(children: [
              new Row(children: <Widget>[
            Expanded(
                child: SizedBox(
                    height: 100,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          return FlatButton(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CategoryPageWidget(categories[index]);
                                }));
                              },
                              child: GridTile(
                                child: Center(
                                  child: Text(
                                    categories[index].name,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ); //Text('oui');
                          /*return ActionChip(
                                label: Text(
                                  categories[index].name,
                                ),
                                onPressed: () {
                                  print(
                                      "If you stand for nothing, Burr, what’ll you fall for?");
                                });*/
                        })))
          ]);
          //]);
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _categoryButtonView() {
    return FutureBuilder(
      future: db.collection("category").getDocuments(),
      builder: (context, snapshot) {
        print('snapshot ${snapshot}');

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
                return FlatButton(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CategoryPageWidget(categories[index]);
                      }));
                    },
                    child: GridTile(
                      child: Center(
                        child: Text(
                          categories[index].name,
                          textAlign: TextAlign.center,
                        ),
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

  Widget _gridView() {
    return FutureBuilder(
      future: db.collection("category").getDocuments(),
      builder: (context, snapshot) {
        print('snapshot ${snapshot}');

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
    );

    /*return new StreamBuilder(
      stream: getCategorieList(context),
      builder: (BuildContext context, snapshot) {
        return GridView.builder(
          itemCount: 4, //snapshot.data.documents.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            _nameCategory =
                "${snapshot.data.documents[index]['nom_categorie']}";
            _imageCategory = "${snapshot.data.documents[index]['photo']}";
            _collectionCategory =
                "${snapshot.data.documents[index]['collection']}";
            _indexCategory = "${snapshot.data.toString()}";
            _categories.add(Category(_indexCategory, _nameCategory,
                _imageCategory, _collectionCategory));
            //return _categoryWidgetFromModel(_categories[index]);
            return new GestureDetector(
              child: new Card(
                  elevation: 5.0,
                  child: new Container(
                    alignment: Alignment.centerLeft,
                    margin: new EdgeInsets.all(5.0),
                    child: ListView(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(_categories[index].name,
                            textAlign: TextAlign.center),
                        Padding(
                            padding: EdgeInsets.all(10.0),
                            child: LoadFirebaseStorageImage(
                                _categories[index].image,
                                120,
                                200,
                                "categorie")),
                      ],
                    ),
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CategoryPageWidget(
                          index: index,
                          name: _categories[index]
                              .name)), ////////////////////////////////////////////////
                );
              },
            );
          },
        );
      },
    );*/
  }

  /*void goToCategoryPage(int category) {
    switch (category) {
      case 1:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Category1PageWidget();
          }));
        }
        break;

      case 2:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Category1PageWidget();
          }));
        }
        break;

      default:
        {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Category1PageWidget();
          }));
        }
    }
  }*/
}
