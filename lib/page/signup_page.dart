import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoikos/page/main_page.dart';
import 'package:phoikos/utils/constants.dart';

import 'login_page.dart';

class SignUpPageWidget extends StatefulWidget {
  @override
  _SignUpPageWidgetState createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  bool _rememberMe = false;

  Widget _buildSignupPage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: FlatButton(
            onPressed: () => goToSigninPage,
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'CONNEXION',
              style: kLabelStyle,
            ),
          ),
        ),
        Expanded(
          child: FlatButton(
            onPressed: () => print('Forgot Password Button Pressed'),
            padding: EdgeInsets.only(right: 0.0),
            child: Text(
              'INSCRIPTION',
              style: ChangePage,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildEmailTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
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
                color: Colors.white,
              ),
              hintText: 'Tapez votre adresse email',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
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
          child: TextField(
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
              hintText: 'Tapez votre Mot de Passe',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Text(
            'Se souvenir de moi',
            style: kLabelStyle,
          ),
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Color.fromRGBO(115, 44, 30, 0.81),
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oublié?',
          style: kLabelStyle,
        ),
      ),
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Vous n\'avez pas de compte? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Inscrivez-vous',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
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
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Phoïkos',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildSignupPage(),
                      SizedBox(
                        height: 30.0,
                      ),

                      _buildEmailTF(),
                      _buildPasswordTF(),
                      _buildLoginBtn(),

                      //_buildSignupBtn(),
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
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return MainPageWidget();
    }));
  }

  void goToSigninPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return LoginPageWidget();
    }));
  }
}
