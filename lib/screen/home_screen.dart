import 'package:flutter/material.dart';
import 'package:phoikos/model/Category.dart';
import 'package:phoikos/page/category_1_page.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();

    for (int i = 1; i < 11; i++) {
      _categories.add(Category(i, 'Category ' + '$i',
          'assets/images/categories/image_' + '$i' + '.jpg'));
    }
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
        backgroundColor: Color(0xFF90AB77),
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
              Color(0xFFE3FFC7),
              Color(0xFFC7E2AC),
              Color(0xFFABC691),
              Color(0xFF90AB77),
            ],
            stops: [0.1, 0.4, 0.7, 0.9],
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

  Widget _categoryWidgetFromModel(Category category) {
    return Card(
      child: Column(
        children: <Widget>[Text(category.name)],
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      itemCount: _categories.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        //return _categoryWidgetFromModel(_categories[index]);
        return new GestureDetector(
          child: new Card(
              elevation: 5.0,
              child: new Container(
                alignment: Alignment.centerLeft,
                margin: new EdgeInsets.all(5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(_categories[index].name),
                    Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Image.asset(_categories[index].image,
                            width: 200, height: 100)),
                  ],
                ),
              )),
          onTap: () {
            goToCategoryPage(this._categories[index].id);
          },
        );
      },
    );
  }

  void goToCategoryPage(int category) {
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
  }
}
