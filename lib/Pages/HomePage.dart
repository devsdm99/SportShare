import 'package:flutter/material.dart';
import 'package:sportshareapp/Pages/ProfilePage.dart';
import '../BackgroundGradient.dart';
import 'package:sportshareapp/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomePage extends StatefulWidget{
  @override
  HomePage({this.auth, this.onSignedOut});
  final BaseAuth auth;
  final VoidCallback onSignedOut;

  State<StatefulWidget> createState ()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{

  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

  _setSelected(int position){
    setState((){
      currentPage = position;
    });
  }
  void _signOut()async{
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
    home: Scaffold( 
      bottomNavigationBar: FancyBottomNavigation(
        circleColor: Colors.white,
        inactiveIconColor: Colors.white,
        activeIconColor: Colors.red,
        tabs: [
            TabData(iconData: Icons.home, title: "Home",),
            TabData(iconData: Icons.search, title: "Search"),
            TabData(iconData: Icons.location_on, title: "Close"),
            TabData(iconData: Icons.person, title: "Profile")
        ],
        barBackgroundColor: Color.fromRGBO(255, 105, 45, 10),
        onTabChangedListener: (position) {
          _setSelected(position);
        },
      ),
      body: new Container(
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
    ),
  );  
}
  _getPage(int page) {
  switch (page) {
    case 0:
    break;
    case 1:
    break;
    case 2:   
    break;
    case 3:
      return new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProfilePage()
        ],
      );
    }
  }
}