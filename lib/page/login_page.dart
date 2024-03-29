import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoikos/page/forget_password_page.dart';
import 'package:phoikos/page/main_page.dart';
import 'package:phoikos/page/signup_page.dart';
import 'package:phoikos/services/firestore_user.dart';
import 'package:phoikos/utils/constants.dart';

class LoginPageWidget extends StatefulWidget {
  @override
  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  bool _rememberMe = false;

  TextEditingController textMail;
  TextEditingController textMdp;

  @override
  void initState() {
    super.initState();

    textMail = TextEditingController();
    textMdp = TextEditingController();
  }

  @override
  void dispose() {
    textMail.dispose();
    textMdp.dispose();

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
                child: Text("CONNEXION", style: ChangePage),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
        ),
        GestureDetector(
          child: Expanded(
            child: Container(
              height: 50,
              child: Center(
                child: Text("INSCRIPTION", style: kLabelStyle),
              ),
            ),
          ),
          onTap: goToSignUpPage,
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
                color: Colors.white,
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
          child: TextField(
            controller: textMdp,
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
        onPressed: () => goToForgetPWD(),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Mot de passe oublié ?',
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
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                    image:
                        AssetImage("assets/images/background/background.png"),
                    fit: BoxFit.cover,
                  ),
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
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      _buildForgotPasswordBtn(),
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
    String mail = textMail.text.trim();
    String mdp1 = textMdp.text.trim();

    if (mail != "") {
      if (mdp1 != "") {
        FirestoreUserPhoikos().connectToAccount(
            mail, mdp1); //trim pour enlever les espaces en trop
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return MainPageWidget();
        }));
      }
    }
  }

  void goToSignUpPage() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return SignUpPageWidget();
    }));
  }

  goToForgetPWD() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return ForgetPasswordPageWidget();
    }));
  }
}
