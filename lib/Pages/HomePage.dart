import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget
{
  const HomePage({Key key, this.user}) : super(key: key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
  
  }
  
  class _HomeState extends State<HomePage> 
  {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home ${widget.user.email}'),
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection(),
      ),
    );
  }
}