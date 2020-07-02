import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoikos/model/Article.dart';
import 'package:phoikos/services/image_downloader.dart';

class ArticleScreenWidget extends StatefulWidget {
  final Article article;

  ArticleScreenWidget(this.article);

  @override
  _ArticleDetailPageState createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleScreenWidget> {
  final _saved = new Set();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _buildPhotoArticle() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(25.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: LoadFirebaseStorageImage(
                    widget.article.image, 200, 30, "article"),
              )),
        ],
      )
    ]);
  }

  Widget _buildTitleAndFav(bool pair) {
    final _alreadySaved = _saved.contains(pair);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
        title: Text(
          widget.article.name,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: new Icon(
          _alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: _alreadySaved ? Color.fromRGBO(228, 101, 76, 0.81) : null,
        ),
        onTap: () {
          setState(() {
            if (_alreadySaved) {
              _saved.remove(pair);
            } else {
              _saved.add(pair);
            }
          });
        },
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: widget.article.intro + "\n",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPara1() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: widget.article.para_1 + "\n",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildPara2() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(
          text: widget.article.para_2 + "\n",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.name),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(23, 69, 58, 0.81),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
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
                    image:
                        AssetImage("assets/images/background/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 1.0),
                      _buildPhotoArticle(),
                      SizedBox(
                        height: 1.0,
                      ),
                      _buildTitleAndFav(null),
                      _buildIntro(),
                      _buildPara1(),
                      _buildPara2(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
