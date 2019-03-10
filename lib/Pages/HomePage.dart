import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'package:sportshareapp/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        title: Text('Welcome'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  floatingActionButton: FloatingActionButton(
    onPressed: () { },
    tooltip: 'Increment',
    child: Icon(Icons.add),
    elevation: 2.0,
  ),
  bottomNavigationBar: BottomAppBar(
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[],
    ),
    shape: CircularNotchedRectangle(),
    color: Colors.blueGrey,
),
    );
  }
}