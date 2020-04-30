import 'package:flutter/material.dart';

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
            Expanded(child: _gridView()),
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 1,
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Image(
                image: AssetImage('assets/images/team/group_photo.jpg'),
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
                      "L'équipe Phoïkos c'est formée à l'occasion d'un projet.",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage('assets/images/team/gloria.jpg'),
              ),
            ),
            Container(
              height: 100,
              width: 20,
            ),
            Expanded(
              child: Text(
                  "Pas tout à fait 'éco-responsable' dans l'âme il y a encore quelques mois, "
                  "je vivais une prise de conscience progressive au moment de ma rencontre avec le groupe. Grâce à ce projet,"
                  " je fais chaque jour des petits pas supplémentaires,"
                  " en étant convaincue que ce sont ces multitudes de gestes simples qui contribueront à la préservation de notre environnement.",
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
                    'Après mes études en marketing, j’ai décidé de m’axer plus dans le digital. '
                    'Le bachelor E-Business me permet d’allier ma passion pour la création design et de contenu au marketing.'
                    ' Ce projet me tient à cœur puisque dans mon quotidien, je me tourne de plus en plus vers une démarche éco-responsable, '
                    'par des gestes simples et une approche à la consommation différente.',
                    textAlign: TextAlign.center)),
            Container(
              height: 100,
              width: 20,
            ),
            Expanded(
              child: Image(
                image: AssetImage('assets/images/team/sebastien.jpg'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage('assets/images/team/aissata.jpg'),
              ),
            ),
            Container(
              height: 100,
              width: 20,
            ),
            Expanded(
              child: Text(
                  "J‘ai décidé de tourner ma reconversion professionnelle dans une activité me permettant de travailler dans le digital. "
                  "La transversalité des cours ainsi que des projets que nous faisons nous permet de mettre en avant cet ensemble de compétences."
                  " Active pour notre planète il été pour moi logique de me positionner sur la réussite de l’application éco-responsable “Phoïkos”",
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: Text(
                    "Suite à mes études en BTS assistant de gestion,"
                    " j’ai décidé de me réorienter dans le domaine du numérique. "
                    "Le Bachelor Webmarketing et Social Media me permet d’élargir mes compétences en Management et Gestion de projet tout en développant "
                    "de nouvelles compétences."
                    " Le projet Phoïkos est important pour moi car je me tourne de plus en plus vers une démarche éco-responsable.",
                    textAlign: TextAlign.center)),
            Container(
              height: 100,
              width: 20,
            ),
            Expanded(
              child: Image(
                image: AssetImage('assets/images/team/alexandre.jpg'),
              ),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Image(
                image: AssetImage('assets/images/team/naig.jpg'),
              ),
            ),
            Container(
              height: 100,
              width: 20,
            ),
            Expanded(
              child: Text(
                  "Grande curieuse, je pratique beaucoup d'activités au quotidien telles que le théâtre, "
                  "la couture ou encore la musique. Aimant m'intéresser à divers sujets de société, "
                  "l'écologie et la protection de notre planète et des animaux a tout de suite été un sujet captivant. "
                  "C'est cette prise de conscience écologique que j'ai eu il y a quelques mois qui m'a poussée à proposer ce projet à mes camarades.",
                  textAlign: TextAlign.center),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                  "Actuellement en bachelor developpement web, j'ai voulu allier mon travail avec une cause juste. "
                  "Vivant déjà dans une démarche éco-responsable, Phoïkos est important pour moi,"
                  " et j'aimerai grâce à cette application aider les personnes dans leurs démarche éco-responsable.",
                  textAlign: TextAlign.center),
            ),
            Container(
              height: 100,
              width: 20,
            ),
            Expanded(
              child: Image(
                image: AssetImage('assets/images/team/clement.jpg'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
