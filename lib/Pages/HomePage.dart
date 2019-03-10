import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'package:sportshareapp/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';


class HomePage extends StatelessWidget{
  const HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  

  void _signOut()async{
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {
      print(e);

    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: Text(
        'LATEST EVENTS',
        textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.black
      ),
      ),
    ),  
    bottomNavigationBar: FancyBottomNavigation(
    circleColor: Colors.white,
    inactiveIconColor: Colors.white,
    activeIconColor: Colors.red,
    tabs: [
        TabData(iconData: Icons.home, title: "Home",),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.person, title: "Profile"),
        TabData(iconData: Icons.add_box, title: "Add")
    ],
    barBackgroundColor: Color.fromRGBO(255, 105, 45, 10),
    onTabChangedListener: (position) {
    },
  ),


    body: new Form(
        child: new Stack(
          children: <Widget>[
            new BackgroundGradient()
          ],
        ),
      ),
    );
  }
}