import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:sportshareapp/BackgroundGradient.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../auth.dart';
class ProfilePage extends StatefulWidget
{
  @override
  ProfilePage({this.uid, this.auth});
  final String uid;
  final BaseAuth auth;
  
  State<StatefulWidget> createState() => _ProfilePageState();

}

class editWidget extends StatelessWidget
{
  @override
  Widget build(BuildContext context)  {
    return  GestureDetector(
        onTap: (){
          _showDialog(context);
        },
        child:new Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        color: Colors.white10,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: new Text('EDIT ',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Roboto',
            color: Colors.white
          ),),
        ), 
      ),
      );

  }

    Future<Widget> _showDialog(BuildContext context) async {
    await showDialog<String>(
      context: context,
      child: new AlertDialog(
        contentPadding: const EdgeInsets.all(16.0),
        content: new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Full Name', hintText: 'eg. John Smith'),
              ),
            )
          ],
        ),
        actions: <Widget>[
          new FlatButton(
              child: const Text('CANCEL', style: TextStyle(color: Colors.red),),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          new FlatButton(
              child: const Text('OPEN'),
              onPressed: () {
                Navigator.pop(context);
              })
        ],
      ),
    );
  }
  
}

class _ProfilePageState extends State<ProfilePage> {

  Future getEvents() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("events").document(widget.uid).collection("UserEvents").getDocuments();
    return qn.documents;
  }

  Future<void> signOut() async{
          showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: new Text("ALERT!"),
          content: new Text("Logout is still not released.\nComing soon"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close",
              style: TextStyle(
                color: Colors.black
              ),),
              onPressed: (){
                Navigator.of(context).pop();
              },
            )
          ],
        );
      }
    );
  }

  final ref = FirebaseStorage.instance.ref().child('testimage');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          BackgroundGradient(),
          ListView(
          children: <Widget>[
            new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2),
                child: new Container(
                height: 100,
                width: 100,
                child: new Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: new Text("ALERT!"),
                              content: new Text("Edit mode is still not released.\nComing soon"),
                              actions: <Widget>[
                                new FlatButton(
                                  child: new Text("Close",
                                  style: TextStyle(
                                    color: Colors.black
                                  ),),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                )
                              ],
                            );
                          }
                        );
                      },
                      child:new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.white10,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: new Text('EDIT ',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        ),),
                      ), 
                    ),
                    )
                  ],
                ) 
              ),
              ),
              new Container(
                height: 100,
                width: 120,
                child: new Column(
                  children: <Widget>[
                    new GestureDetector(
                          onTap: () {
                            signOut();
                          }, 
                      child: new Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      color: Colors.white10,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: new Text('Logout ',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          color: Colors.white
                        ),),
                      ), 
                    ),
                    )
                  ],
                ) 
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Hero(
                tag: 'assets/guti.jpg',
                child: new Column(
                  children: <Widget>[
                    BackgroundGradient(),
                    Container(
                        height: 125.0,
                        width: 125.0,
                        decoration: BoxDecoration(                    
                        borderRadius: BorderRadius.circular(62.5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/guti.jpg'),       
                          ),
                        ),
                      ),
                  ],
                ), 
              ),
              SizedBox(height: 25.0),
              Text(
                'Guti',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 4.0),
              Text(
                'Palamós',
                style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
              ),
                            Padding(
                padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '∞',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'FOLLOWERS',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '∞',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'EVENTS',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '∞',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'FRIENDS',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
              SizedBox(height: 10.0),
              new Row(
                children: <Widget>[   
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Teammates: ',
                      style: TextStyle(
                        fontFamily: 'Roboto', 
                        color: Colors.white,
                         fontSize: 23,
                         fontWeight: FontWeight.bold
                        ),
                    ), 
                  )
                ],
              ),
              SizedBox(height: 4.0),
              Container(
                color: Colors.redAccent,
                child:Padding(
                padding: EdgeInsets.all(20),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: new Column(
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(                    
                        borderRadius: BorderRadius.circular(62.5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/carreras.jpg'),       
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(3),
                        child: Text("Sergi", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      )
                    ],
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: new Column(
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(                    
                        borderRadius: BorderRadius.circular(62.5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/vanesa.jpg'),       
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text("Vanesa", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      )
                    ],
                  ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(0),
                    child: new Column(
                    children: <Widget>[
                      Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(                    
                        borderRadius: BorderRadius.circular(62.5),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/isa.jpg'),       
                          ),
                        ),
                      ),
                      new Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Text("Isa", style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),),
                      )
                    ],
                  ),
                  ),
                ],
              ),
              ),
              ),
              new Row(
                children: <Widget>[   
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Description: ',
                      style: TextStyle(
                        fontFamily: 'Roboto', 
                        color: Colors.white,
                         fontSize: 23,
                         fontWeight: FontWeight.bold
                        ),
                    ), 
                  )
                ],
              ),
              new Column(
                children: <Widget>[ 
                  new Container(
                  height: 150.0,
                  color: Colors.transparent,
                  child: new Container(
                      decoration: new BoxDecoration(
                          color: Colors.redAccent,  
                          borderRadius: new BorderRadius.only(
                              topLeft: const Radius.circular(40.0),
                              topRight: const Radius.circular(40.0),
                              bottomLeft: const Radius.circular(40.0),
                              bottomRight: const Radius.circular(40.0))),
                      child: new Center(
                        child: new Text(
                          '"That`s only two lines of code"',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Roboto',
                          fontSize: 20
                        ),
                        ),
                      )),
                    ),
                    ],
                  ),
                ],
              ),
            ],
          ),   
        ],
      )
    );
  }
}

