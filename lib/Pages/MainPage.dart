import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../BackgroundGradient.dart';


class MainPage extends StatefulWidget
{
  MainPage({this.uid});
  String uid;
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State<MainPage>
{
  
  @override
  Widget build(BuildContext context) {
  double widthScreen = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          BackgroundGradient(),
          SingleChildScrollView(
            child:           Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                Container(
                  height: 125,
                  width: widthScreen,
                  color: Colors.red,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top:50),
                        child: Column(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text("Welcome to SportShare",
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Architects',
                                  fontSize: 20),
                                  ),
                                  Text("Josep",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Architects',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        child:Container(
                        height: 75.0,
                        width: 75.0,
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
                ],
              ),
              new Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("What's new in Sportshare?", style: TextStyle(
                      color:  Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Architects',
                    ),)
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                          width: 200,
                          height: 200,
                          color: Colors.redAccent,
                          child: new Card(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("       2+\nNEW EVENTS", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Architects',
                                ),)
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    new Column(
                      children: <Widget>[
                        new Container(
                          width: 200,
                          height: 200,
                          color: Colors.redAccent,
                          child: new Card(
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("New UI", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Architects',
                                ),)
                              ],
                            ),
                          ),
                          ),

                      ],
                    )
                  ],
                ),
              ),
              new Padding(
                padding: EdgeInsets.only(top:30, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Future updates", style: TextStyle(
                      color:  Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Architects',
                    ),)
                  ],
                ),
              ),
              new Container(
                width: 300,
                height: 250,
                color: Colors.redAccent,
                child: new Card(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("1. Chat mode", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Architects',
                      ),),
                      Text("2. Add friends", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Architects',
                      ),),
                      Text("3. Group creations", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Architects',
                      ),),
                      Text("4. Login via Google", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Architects',
                      ),)
                    ],
                  ),
                ),
              )
            ],
          ),
          )

        ],
      ),   
    );
  }

  
}