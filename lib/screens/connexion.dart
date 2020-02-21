import 'package:flutter/material.dart';
import 'package:phoikos/screens/accueil.dart';

class Connexion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/logo/phoikos.png'),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return Accueil();
                    }),
                  );
                },
                child: Text(
                  'Connexion',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ]),
      ),
    );
  }
}
