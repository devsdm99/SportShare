import 'package:flutter/material.dart';
import 'package:sportshareapp/Pages/ProfilePage.dart';
import '../BackgroundGradient.dart';
import 'package:sportshareapp/auth.dart';
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class HomePage extends StatefulWidget{
  @override
  HomePage({this.auth, this.onSignedOut, this.uid});
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  final String uid;

  State<StatefulWidget> createState ()=> _HomePageState();
}
class _HomePageState extends State<HomePage>{

  int currentPage = 0;
  GlobalKey bottomNavigationKey = GlobalKey();

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
      bottomNavigationBar: FlipBoxBar(
        items: [
            FlipBarItem(icon: Icon(Icons.home), text: Text("Home"), frontColor: Colors.white, backColor: Colors.orangeAccent),
            FlipBarItem(icon: Icon(Icons.search), text: Text("Search"), frontColor: Colors.white, backColor: Colors.orangeAccent),
            FlipBarItem(icon: Icon(Icons.add), text: Text("Add"), frontColor: Colors.white, backColor: Colors.orangeAccent),  
            FlipBarItem(icon: Icon(Icons.map), text: Text("Events"), frontColor: Colors.white, backColor: Colors.orangeAccent),
            FlipBarItem(icon: Icon(Icons.person), text: Text("Profile"), frontColor: Colors.white, backColor: Colors.orangeAccent),        ],
        onIndexChanged: (newIndex) {
          setState(() {
            currentPage = newIndex;
          });
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
    if(page == 4)
    {
      return ProfilePage(uid: widget.uid);
    }
  }
}