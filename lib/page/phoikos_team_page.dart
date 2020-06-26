import 'package:flutter/material.dart';
import 'package:phoikos/page/search_page.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class PhoikosTeamPagePageWidget extends StatefulWidget {
  @override
  _PhoikosTeamPageWidgetState createState() => _PhoikosTeamPageWidgetState();
}

class _PhoikosTeamPageWidgetState extends State<PhoikosTeamPagePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('La team Phoïkos',
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
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                              image:
                                  AssetImage('assets/images/team/gloria.jpg')),
                        ),
                      ),
                      Container(
                        child: DetailsGloria(),
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
                    "Pas tout à fait 'éco-responsable' dans l'âme il y a encore quelques mois, "
                    "je vivais une prise de conscience progressive au moment de ma rencontre avec le groupe. Grâce à ce projet,"
                    " je fais chaque jour des petits pas supplémentaires,"
                    " en étant convaincue que ce sont ces multitudes de gestes simples qui contribueront à la préservation de notre environnement.",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
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
                        child: DetailsSebastien(),
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                  'assets/images/team/sebastien.jpg')),
                        ),
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
                title: "",
                style: alertStyle,
                desc:
                    'Après mes études en marketing, j’ai décidé de m’axer plus dans le digital. '
                    'Le bachelor E-Business me permet d’allier ma passion pour la création design et de contenu au marketing.'
                    ' Ce projet me tient à cœur puisque dans mon quotidien, je me tourne de plus en plus vers une démarche éco-responsable, '
                    'par des gestes simples et une approche à la consommation différente.',
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
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
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                              image:
                                  AssetImage('assets/images/team/aissata.jpg')),
                        ),
                      ),
                      Container(
                        child: DetailsAissata(),
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
                title: "",
                style: alertStyle,
                desc:
                    "J‘ai décidé de tourner ma reconversion professionnelle dans une activité me permettant de travailler dans le digital. "
                    "La transversalité des cours ainsi que des projets que nous faisons nous permet de mettre en avant cet ensemble de compétences."
                    " Active pour notre planète il été pour moi logique de me positionner sur la réussite de l’application éco-responsable “Phoïkos”",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
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
                        child: DetailsAlexandre(),
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image: AssetImage(
                                  'assets/images/team/alexandre.jpg')),
                        ),
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
                title: "",
                style: alertStyle,
                desc: "Suite à mes études en BTS assistant de gestion,"
                    " j’ai décidé de me réorienter dans le domaine du numérique. "
                    "Le Bachelor Webmarketing et Social Media me permet d’élargir mes compétences en Management et Gestion de projet tout en développant "
                    "de nouvelles compétences."
                    " Le projet Phoïkos est important pour moi car je me tourne de plus en plus vers une démarche éco-responsable.",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
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
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                              image: AssetImage('assets/images/team/naig.jpg')),
                        ),
                      ),
                      Container(
                        child: DetailsNaig(),
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
                title: "",
                style: alertStyle,
                desc:
                    "Grande curieuse, je pratique beaucoup d'activités au quotidien telles que le théâtre, "
                    "la couture ou encore la musique. Aimant m'intéresser à divers sujets de société, "
                    "l'écologie et la protection de notre planète et des animaux a tout de suite été un sujet captivant. "
                    "C'est cette prise de conscience écologique que j'ai eu il y a quelques mois qui m'a poussée à proposer ce projet à mes camarades.",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
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
                        child: DetailsClement(),
                      ),
                      Container(
                        width: 250,
                        height: 250,
                        child: ClipRRect(
                          borderRadius: new BorderRadius.circular(24.0),
                          child: Image(
                              fit: BoxFit.contain,
                              alignment: Alignment.topRight,
                              image:
                                  AssetImage('assets/images/team/clement.jpg')),
                        ),
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
                title: "",
                style: alertStyle,
                desc:
                    "Actuellement en bachelor developpement web, j'ai voulu allier mon travail avec une cause juste. "
                    "Vivant déjà dans une démarche éco-responsable, Phoïkos est important pour moi,"
                    " et j'aimerai grâce à cette application aider les personnes dans leurs démarche éco-responsable.",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
                    child: Text(
                      "Fermer",
                      style: TextStyle(color: Color(0xFFFFFFE3), fontSize: 20),
                    ),
                  ),
                ]).show();
          },
        ),
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
                              fit: BoxFit.contain,
                              alignment: Alignment.topLeft,
                              image:
                                  AssetImage('assets/images/team/malvyn.jpg')),
                        ),
                      ),
                      Container(
                        child: DetailsMalvyn(),
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
                title: "",
                style: alertStyle,
                desc:
                    "Passionné depuis tout jeune par le web, la musique, la faune, la flore ou encore l’astronomie; "
                    "je n’ai jamais perdu mes rêves d’enfants. Soucieux depuis toujours de l’environnement et son évolution,"
                    " j’ai enfin trouvé avec phoikos la manière de mettre mes capacités en valeur et "
                    "ma pierre à l’édifice pour ce dur combat qu’est celui de l’écologie.",
                buttons: [
                  DialogButton(
                    onPressed: () => Navigator.pop(context),
                    radius: BorderRadius.circular(24.0),
                    color: Color.fromRGBO(228, 101, 76, 0.75),
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

  void goToSearchPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SearchPageWidget();
    }));
  }
}

Widget DetailsGloria() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
            child: Text(
          "Gloria",
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
              "Chef de projet",
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

Widget DetailsSebastien() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Container(
            child: Text(
          "Sebastien",
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "Web-Marcket",
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

Widget DetailsAissata() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
            child: Text(
          "Aissata",
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
              "Designer",
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

Widget DetailsAlexandre() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Container(
            child: Text(
          "Alexandre",
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "Web-Marcket",
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

Widget DetailsNaig() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
            child: Text(
          "Naig",
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
              "Développeur",
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

Widget DetailsClement() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Container(
            child: Text(
          "Clément",
          style: TextStyle(
              color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                child: Text(
              "Développeur",
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

Widget DetailsMalvyn() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Container(
            child: Text(
          "Malvyn",
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
              "Développeur",
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
