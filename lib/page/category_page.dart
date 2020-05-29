import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/model/Category.dart';
import 'package:phoikos/screen/article_screen.dart';

class CategoryPageWidget extends StatefulWidget {
  final Category category;

  CategoryPageWidget(this.category);

  @override
  _CategoryPageWidgetState createState() => _CategoryPageWidgetState();
  /*final int index;
  final String name;

  const CategoryPageWidget({Key key, this.index, this.name}) : super(key: key);

  @override
  _CategoryPageWidgetState createState() => _CategoryPageWidgetState();*/
}

class _CategoryPageWidgetState extends State<CategoryPageWidget> {
  final db = Firestore.instance;

  /*@override
  void initState() {
    super.initState();
  }*/

  /*setState(() {
        print('Lenght : $_articles.lenght');
      });*/

  /*
    for (int i = 0; i < 3; i++) {
      //db.collection("article").snapshots();
      //_nameImage = "${snapshot.data.documents[i]['photo']}";
      //_nameArticle = "${snapshot.data.documents[i]['title']}";
      _articles.add(Article(i, db.child("article")., "oui"));
    }
    //print("les articles " + _articles[0].name);*/

  String _categoryTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*title: StreamBuilder(
          stream: db.collection("category").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return CircularProgressIndicator();
            _categoryTitle =
                "${snapshot.data.documents[widget.index]['nom_categorie']}";
            return Text(
              _categoryTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            );
          },
        ),*/
        title: Text(widget.category.name),
        centerTitle: true,
        backgroundColor: Color(0xFF5a9216),
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
        child: FutureBuilder(
          future: db
              .collection("category")
              .document(widget.category.id)
              .collection(widget.category.collection)
              .getDocuments(),
          builder: (context, snapshot) {
            print('snapshot ${snapshot}');

            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              List<Article> articles = [];

              var querySnapshot = snapshot as AsyncSnapshot<QuerySnapshot>;

              querySnapshot.data.documents.forEach((element) {
                print('${element.data}');
                print('${element.documentID}');
                articles.add(Article.fromJSON(element.data));
              });

              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ArticleScreenWidget(articles[index]);
                          }));
                        },
                        child: GridTile(
                          child: Center(
                            child: Text(articles[index].name),
                          ),
                        ),
                      ),
                    );
                  });
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
        /*decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFbef67a),
              Color(0xFF8bc34a),
              Color(0xFF5a9216),
            ],
            stops: [0.1, 0.4, 0.9],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(child: _gridView()),
          ],
        ),*/
      ),
    );
  }

  /*Stream<QuerySnapshot> getArticleList(BuildContext context) async* {
    yield* db
        .collection("category")
        .document(widget.name)
        .collection("transport")
        .snapshots();
  }*/

  /*Widget _gridView() {
    List<Article> _articles = [];
    String _imageArticle;
    String _nameArticle;
    String _indexArticle;

    return new StreamBuilder(
      stream: getArticleList(context),
      builder: (BuildContext context, snapshot) {
        //if (!snapshot.hasData) return Text("Problem of data !");
        return GridView.builder(
          itemCount:
              0, //snapshot.data.documents.length,///////////////////////////////////////////////////////////////////////////////////////////
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            _nameArticle = "${snapshot.data.documents[index]['title']}";
            _imageArticle = "${snapshot.data.documents[index]['photo']}";
            _indexArticle = "${snapshot.data.toString()}";
            _articles.add(Article(_nameArticle, _imageArticle)); //,
            //_indexArticle, null, null, null, null
            return new GestureDetector(
                child: new Card(
                    elevation: 5.0,
                    child: new Container(
                      alignment: Alignment.centerLeft,
                      margin: new EdgeInsets.all(5.0),
                      child: ListView(
                        //Column
                        //mainAxisAlignment: MainAxisAlignment.center,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(_articles[index].name,
                              textAlign: TextAlign.center),
                          Padding(
                              padding: EdgeInsets.all(10.0),
                              child: LoadFirebaseStorageImage(
                                  _articles[index].image,
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
                        builder: (context) => ArticleScreenWidget(index)),
                  );
                });
          },
        );
      },
    );
  }*/
}

/*Widget _addArticle(BuildContext context) {
    return new StreamBuilder(
      stream: getArticleList(context),
      builder: (BuildContext context, snapshot) {
        if (!snapshot.hasData) return Text("Problem of data !");
        return new ListView.builder(
          itemCount: snapshot.data.documents.length,
          itemBuilder: (BuildContext context, int index) =>
              new Article(index, snapshot.data.documents[index]['title'], snapshot.data.documents[index]['photo']);
        );
      },
    );
  }*/
