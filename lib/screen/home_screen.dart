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

    for (int i = 0; i < 100; i++) {
      _categories.add(Category('Name', 'Title'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        centerTitle: true,
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
      body: Column(
        children: <Widget>[Expanded(child: _gridView())],
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
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return _categoryWidgetFromModel(_categories[index]);
      },
    );
  }
}
