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

class _ProfilePageState extends State<ProfilePage> {

  Future getEvents() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("events").document(widget.uid).collection("UserEvents").getDocuments();
    return qn.documents;
  }

  Future<void> signOut() async{
      await widget.auth.signOut();
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
                    new GestureDetector(
                      onTap: (){
                        Alert(
                          context: context,
                          title: "LOGIN",
                          content: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.account_circle),
                                  labelText: 'Username',
                                ),
                              ),
                              TextField(
                                obscureText: true,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.lock),
                                  labelText: 'Password',
                                ),
                              ),
                            ],
                          ),
                          buttons: [
                            DialogButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                "LOGIN",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            )
                          ]).show();
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
                          fontFamily: 'Architects',
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
                          fontFamily: 'Architects',
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
                    GestureDetector(
                      child: Container(
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
                    )
                  ],
                ), 
              ),
              SizedBox(height: 25.0),
              Text(
                'El Guti',
                style: TextStyle(
                    fontFamily: 'Architects',
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
                          'FIRENDS',
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
                      'Description: ',
                      style: TextStyle(
                        fontFamily: 'Architects', 
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
                          '"Aixó son 2 linies de codi"',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Architects',
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
                      
Widget buildImages() {
  return Padding(
    padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
    child: Container(
        height: 200.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
                image: AssetImage('assets/beach1.jpg'), fit: BoxFit.cover))),
  );
}

Widget _ackAlert() {
      return AlertDialog(
        title: Text('Enter new data'),
        content: new Stack(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("Ese"),
                Container(
                  width: 2,
                )
              ],
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
}
                      
Widget buildInfoDetail() {
  return Padding(
    padding:
    EdgeInsets.only(left: 25.0, right: 25.0, top: 10.0, bottom: 15.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Maldives - 12 Days',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  fontSize: 15.0),
            ),
            SizedBox(height: 7.0),
            Row(
              children: <Widget>[
                Text(
                  'Teresa Soto',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 11.0),
                ),
                SizedBox(width: 4.0),
                Icon(
                  Icons.timer,
                  size: 4.0,
                  color: Colors.black,
                ),
                SizedBox(width: 4.0),
                Text(
                  '3 Videos',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 11.0),
                )
              ],
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(width: 7.0),
            InkWell(
              onTap: () {},
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Image.asset('assets/navarrow.png'),
              ),
            ),
            SizedBox(width: 7.0),
            InkWell(
              onTap: () {},
              child: Container(
                height: 20.0,
                width: 20.0,
                child: Image.asset('assets/chatbubble.png'),
              ),
            ),
            SizedBox(width: 7.0),
            InkWell(
              onTap: () {},
              child: Container(
                height: 22.0,
                width: 22.0,
                child: Image.asset('assets/fav.png'),
              ),
            )
          ],
        )
      ],
    ),
  );
}


}

