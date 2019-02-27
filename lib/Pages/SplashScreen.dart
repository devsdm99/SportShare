import 'dart:async';

import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'LoginPage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
    //VARIABLES
    final logo = Image.asset(
      "assets/logoapp.png",
      width: 120.0,
      height: 120.0,
    );
    var indicador = CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );

    //PROGRAMA
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new BackgroundGradient(), //PONEMOS EL FONDO PRIMERO
          new Center(//CENTRAMOS
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: new Text(
                    "WELCOME TO SPORTSHARE",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 160.0),
                  child: logo,
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 160.0),
                    child: indicador),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
