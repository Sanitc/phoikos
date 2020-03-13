import 'package:flutter/material.dart';
import 'package:phoikos/utils/colors.dart';

class ArticleScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article Title',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Color(0xFF90AB77),
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
              Color(0xFFE3FFC7),
              Color(0xFFC7E2AC),
              Color(0xFFABC691),
              Color(0xFF90AB77),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(25.0),
                child: Image(
                  image: AssetImage('assets/images/category_1/phoques.jpg'),
                  height: 200,
                  width: 300,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: RichText(
                  textAlign: TextAlign.justify,
                  text: TextSpan(
                    text:
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
                        " Vivamus ultrices congue consectetur. Integer facilisis, "
                        "nulla at varius gravida, nisi elit hendrerit leo, non porttitor "
                        "dui ipsum a leo. Nam pretium mi turpis. In sed lorem sit amet purus "
                        "venenatis volutpat. Phasellus eu pellentesque risus, eget congue mauris."
                        " Etiam eget justo ut mi ullamcorper bibendum. Aliquam placerat lectus ut "
                        "diam aliquet, sed faucibus lacus consectetur. Phasellus eget nunc ipsum. "
                        "Ut vestibulum blandit justo non pulvinar. Interdum et malesuada fames ac "
                        "ante ipsum primis in faucibus. Praesent dictum, ex at semper blandit. ",
                    style: TextStyle(
                      color: PColors.textColor,
                    ),
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
