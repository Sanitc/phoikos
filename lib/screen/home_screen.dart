import 'package:flutter/material.dart';
import 'package:phoikos/model/Category.dart';

class HomeScreenWidget extends StatefulWidget {
  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  List<Category> _categories = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < 10; i++) {
      _categories.add(Category('Name', 'Title'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil',
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
          children: <Widget>[Expanded(child: _gridView())],
        ),
      ),
    );
  }

  Widget _categoryWidgetFromModel(Category category) {
    return Card(
      child: Column(
        children: <Widget>[Text(category.title), Text(category.name)],
      ),
    );
  }

  Widget _gridView() {
    return GridView.builder(
      itemCount: _categories.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return _categoryWidgetFromModel(_categories[index]);
      },
    );
  }
}
