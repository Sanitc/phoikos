import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phoikos/page/login_page.dart';
import 'package:splashscreen/splashscreen.dart';

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPageWidget(),
    );
  }
}*/

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return new SplashScreen(
      seconds: 8,
      navigateAfterSeconds: AfterSplash(),
      image: Image.asset('assets/images/logo/phoikos_title.png'),
      gradientBackground: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.1, 0.5, 0.9],
        colors: [
          Color.fromRGBO(23, 69, 58, 0.81),
          Color.fromRGBO(46, 137, 116, 0.81),
          Color.fromRGBO(65, 236, 133, 0.56)
        ],
      ),
      photoSize: 150.0,
      loaderColor: Colors.white,
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPageWidget(),
    );
  }
}
