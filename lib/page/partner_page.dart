import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PartnerPagePageWidget extends StatefulWidget {
  @override
  _PartnerPageWidgetState createState() => _PartnerPageWidgetState();
}

class _PartnerPageWidgetState extends State<PartnerPagePageWidget> {
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
            Expanded(child: _gridView()),
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
    backgroundColor: Color.fromRGBO(23, 69, 58, 0.81),
    animationDuration: Duration(milliseconds: 400),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: BorderSide(
        color: Color.fromRGBO(23, 69, 58, 0.81),
      ),
    ),
    titleStyle: TextStyle(
      color: Color(0xFFFFFFE3),
    ),
    descStyle: TextStyle(
      color: Colors.white,
    ),
  );

  Widget _gridView() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: FittedBox(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0xFFC7E2AC),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 250,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.fill,
                              alignment: Alignment.topLeft,
                              image: AssetImage(
                                  'assets/images/logo/logo_Biocoop.png')),
                        ),
                      ),
                      Container(
                        child: DetailsPartner(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            return Alert(
                context: context,
                style: alertStyle,
                title: "",
                desc:
                    "Adresse :\n 8 Rue de la Cerisaie, 35760 Saint-Grégoire \n\n "
                    "Téléphone : \n 02 99 87 14 14 \n\n"
                    "Site Web : \n scarabee-biocoop.fr",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(46, 137, 116, 0.81),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
      ],
    );
  }
}

Widget DetailsPartner() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
            child: Text(
          "Biocoop Scarabée St Grégoire",
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "Magasin d'alimentation bio",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
              ),
            )),
          ],
        )),
      ),
    ],
  );
}
