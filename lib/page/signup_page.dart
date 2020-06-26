import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoikos/page/main_page.dart';
import 'package:phoikos/services/firestore_user.dart';
import 'package:phoikos/utils/constants.dart';

import 'login_page.dart';

class SignUpPageWidget extends StatefulWidget {
  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  bool _rememberMe = false;
  TextEditingController textMail;
  TextEditingController textMdp1;
  TextEditingController textMdp2;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    textMail = TextEditingController();
    textMdp1 = TextEditingController();
    textMdp2 = TextEditingController();
  }

  @override
  void dispose() {
    textMail.dispose();
    textMdp1.dispose();
    textMdp2.dispose();

    super.dispose();
  }

  Widget _buildSignupPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          child: Expanded(
            child: Container(
              height: 50,
              child: Center(
                child: Text("CONNEXION", style: kLabelStyle),
              ),
            ),
          ),
          onTap: goToSigninPage,
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          child: Expanded(
            child: Container(
              height: 50,
              child: Center(
                child: Text("INSCRIPTION", style: ChangePage),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Adresse mail',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: textMail,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Tapez votre adresse email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Mot de Passe',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            validator: (String value) {
              if (value.isEmpty) {
                return "L'adress mail ne peut être vide";
              }
            },
            controller: textMdp1,
            obscureText: true,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Tapez votre mot de passe',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }

  Widget _buildPasswordIsOkTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Confirmation du mot de passe',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            controller: textMdp2,
            obscureText: true,
            style: TextStyle(
              color: Colors.grey,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Tapez votre mot de passe',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: goToHomePage,
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color.fromRGBO(115, 44, 30, 0.81),
        child: Text(
          'Valider',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
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
                  /*image: DecorationImage(
                    image:
                        AssetImage("assets/images/background/background.png"),
                    fit: BoxFit.cover,
                  ),*/
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 50.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Image(
                        image:
                            AssetImage('assets/images/logo/phoikos_title.png'),
                      ),
                      SizedBox(height: 10.0),
                      _buildSignupPage(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildEmailTF(),
                      _buildPasswordTF(),
                      _buildPasswordIsOkTF(),
                      _buildLoginBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void goToHomePage() {
    String mail = textMail.text.trim();
    String mdp1 = textMdp1.text.trim();
    String mdp2 = textMdp2.text.trim();

    if (mail != "") {
      if (mdp1 != "") {
        if (mdp2 != "") {
          if (mdp1 == mdp2) {
            FirestoreUserPhoikos().createAccount(
                mail, mdp1); //trim pour enlever les espaces en trop
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return MainPageWidget();
            }));
          }
        }
      }
    }
  }

  void goToSigninPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return LoginPageWidget();
    }));
  }
}
