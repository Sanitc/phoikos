import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        child: SafeArea(
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
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                );
              },
              onItemFound: (Post post, int index) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: ClipRRect(
                                borderRadius: new BorderRadius.circular(3.0),
                                child: Image(
                                    width: 82,
                                    height: 82,
                                    fit: BoxFit.fill,
                                    alignment: Alignment.topLeft,
                                    image: AssetImage(
                                        'assets/images/logo/logo_Biocoop.png')),
                              ),
                            ),
                            Container(
                                child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(right: 32.0),
                                  child: Container(
                                    child: Text(
                                      post.title,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Container(
                                      child: Text(
                                    post.description,
                                  )),
                                ),
                              ],
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
