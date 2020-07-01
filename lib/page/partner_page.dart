import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:phoikos/model/Partner.dart';
import 'package:phoikos/page/search_page.dart';
import 'package:phoikos/services/image_downloader.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PartnerPagePageWidget extends StatefulWidget {
  @override
  _PartnerPageWidgetState createState() => _PartnerPageWidgetState();
}

class _PartnerPageWidgetState extends State<PartnerPagePageWidget> {
  final db = Firestore.instance;
  String markerName = "";
  String markerId = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nos partenaires',
            style: TextStyle(
              color: Colors.white,
            )),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(23, 69, 58, 0.81),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              goToSearchPage();
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
            stops: [0.1, 0.5, 0.9],
            colors: [
              Color.fromRGBO(23, 69, 58, 0.81),
              Color.fromRGBO(46, 137, 116, 0.81),
              Color.fromRGBO(65, 236, 133, 0.56)
            ],
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
                child: FutureBuilder(
                    future: db.collection("partner").getDocuments(),
                    builder: (context, snapshot) {
                      print('snapshot $snapshot');

                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        List<Partner> partners = [];

                        var querySnapshot =
                            snapshot as AsyncSnapshot<QuerySnapshot>;

                        querySnapshot.data.documents.forEach((element) {
                          print('${element.data}');
                          print('${element.documentID}');
                          partners.add(Partner.fromJSON(element.data));
                        });
                        return ListView.separated(
                          padding: EdgeInsets.only(top: 20),
                          //cacheExtent: 100.0,
                          shrinkWrap: true,
                          itemCount: partners.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Container(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: 100,
                                          height: 100,
                                          child: ClipRRect(
                                            borderRadius:
                                                new BorderRadius.circular(8.0),
                                            child: LoadFirebaseStorageImage(
                                                partners[index].photo,
                                                10,
                                                10,
                                                null),
                                          )),
                                      Expanded(
                                        child: ListTile(
                                            title: new Text(
                                          partners[index].name,
                                          style: TextStyle(color: Colors.white),
                                        )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              onTap: () {
                                return Alert(
                                    context: context,
                                    style: alertStyle,
                                    title: "",
                                    desc: "Adresse :\n " +
                                        partners[index].adress +
                                        "\n\n "
                                            "Téléphone : \n " +
                                        partners[index].phone +
                                        "\n\n"
                                            "Site Web : \n" +
                                        partners[index].website,
                                    buttons: [
                                      DialogButton(
                                        //onPressed: () => Navigator.pop(context),
                                        radius: BorderRadius.circular(24.0),
                                        color:
                                            Color.fromRGBO(228, 101, 76, 0.75),
                                        child: Text(
                                          "Fermer",
                                          style: TextStyle(
                                              color: Color(0xFFFFFFE3),
                                              fontSize: 20),
                                        ),
                                      ),
                                    ]).show();
                              },
                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    })),
          ],
        ),
      ),
    );
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.grow,
    isCloseButton: false,
    isOverlayTapDismiss: false,
    //descStyle: TextStyle(fontWeight: FontWeight.bold),
    backgroundColor: Color.fromRGBO(228, 101, 76, 0.75),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: BorderSide(
        color: Color.fromRGBO(228, 101, 76, 0.75),
      ),
    ),
    titleStyle: TextStyle(
      color: Color(0xFFFFFFE3),
    ),
    descStyle: TextStyle(
      color: Colors.white,
    ),
  );

  void goToSearchPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SearchPageWidget();
    }));
  }
}
