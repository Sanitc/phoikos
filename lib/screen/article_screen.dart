import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/services/image_downloader.dart';

class ArticleScreenWidget extends StatefulWidget {
  final Article article;

  ArticleScreenWidget(this.article);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleScreenWidget> {
  /*ArticleScreenWidget(this.index);
  final int index;*/
  final db = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    String _nameImage = widget.article.name;
    String _articleTitle = widget.article.image;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.name),
        /*title: StreamBuilder(
          stream: db.collection("article").snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return CircularProgressIndicator();

            _articleTitle = "${snapshot.data.documents[index]['title']}";
            return Text(
              _articleTitle,
              style: TextStyle(
                color: Colors.white,
              ),
            );
          },
        ),*/
        centerTitle: true,
        backgroundColor: Color(0xFF5a9216),
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
        decoration: BoxDecoration(
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
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: Text(widget.article.name),
                /*child: StreamBuilder(
                  stream: db.collection("article").snapshots(),
                  builder: (context, snapshot) {
                    _articleContent =
                        "${snapshot.data.documents[index]['introduction']}";
                    return RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(text: _articleContent));
                  },
                ),*/
              ),
              Padding(
                  padding: EdgeInsets.all(25.0),
                  child:
                      LoadFirebaseStorageImage(_nameImage, 200, 30, "article")
                  /*child: StreamBuilder(
                    stream: db.collection("article").snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null)
                        return CircularProgressIndicator();
                      _nameImage = "${snapshot.data.documents[index]['photo']}";
                      return LoadFirebaseStorageImage(
                          _nameImage, 200, 30, "article");
                    },
                  )*/
                  ),
              /*Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Container(
                    color: Colors.lightBlueAccent,
                    child: new LoadFirebaseStorageImage(_nameImage),
                  )

                  /*Image(
                  image: AssetImage('assets/images/category_1/phoques.jpg'),
                  height: 200,
                  width: 300,
                ), */
                  ),*/
              //if para_1 != null then afficher padding
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(text: widget.article.name))),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(text: widget.article.name))),
              /*Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: StreamBuilder(
                  stream: db.collection("article").snapshots(),
                  builder: (context, snapshot) {
                    _articleContent =
                        "${snapshot.data.documents[index]['paragraphe_3']}";
                    if (_articleContent == null) return Text("coucou");
                    return RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(text: _articleContent));
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
