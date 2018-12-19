import 'package:flutter/material.dart';
import 'Pages/SplashScreen.dart';

void main() => runApp(new MaterialApp(
  theme: ThemeData(primaryColor: Colors.red, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: new SplashScreen() //CORREMOS LA PANTALLA DE 
));
