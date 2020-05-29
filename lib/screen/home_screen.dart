import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Category.dart';
import 'package:phoikos/page/category_page.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final db = Firestore.instance;

  @override
  void initState() {
    super.initState();

    /*for (int i = 1; i < 11; i++) {
      _categories.add(Category(i, 'Category ' + '$i',
          'assets/images/categories/image_' + '$i' + '.jpg'));
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bonjour user !',
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
          children: <Widget>[
            //SingleChildScrollView(

            //),
            Expanded(child: _gridView()), //LoadFirebaseStorageImage()
          ],
        ),
      ),
    );
  }

  /*Widget _categoryWidgetFromModel(Category category) {
    return Card(
      child: Column(
        children: <Widget>[Text(category.name)],
      ),
    );
  }*/

  Stream<QuerySnapshot> getCategorieList(BuildContext context) async* {
    yield* db.collection("category").snapshots();
  }

  Widget _gridView() {
    /*List<Category> _categories = [];
    String _imageCategory;
    String _nameCategory;
    String _indexCategory;
    String _collectionCategory;

    child:*/
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
