import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sportshareapp/Widgets/EventWidget.dart';

import '../BackgroundGradient.dart';
class FindEventPage extends StatefulWidget{

  _FindEventPage createState() => _FindEventPage();

}

class _FindEventPage extends State<FindEventPage> {
  @override


 Future getEvents() async {
    var firestore = Firestore.instance;
    List<DocumentSnapshot> templist = new List<DocumentSnapshot>();
    QuerySnapshot snapQuery;
    QuerySnapshot qn = await firestore.collection("events").getDocuments();
    for(int i = 0; i < qn.documents.length; i++)
    {
      snapQuery = await firestore.collection("events").document(qn.documents[i].documentID).collection("UserEvents").getDocuments();
      for (var name in snapQuery.documents) {
        templist.add(name);
      }

    }
    return templist;
  }

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      Text('Find a Event ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Roboto'
                      ),),
                      new Icon(
                        Icons.find_in_page
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
        backgroundColor: Colors.red    
      ),
      body: new Stack(
        children:<Widget>[
          BackgroundGradient(),
          Padding(
              padding: EdgeInsets.all(20),
              child:new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new InkWell(
                    child: new Container(
                      height: 100,
                      width: 340,
                      decoration: BoxDecoration(
                        boxShadow: [
                          new BoxShadow(
                              color: Colors.black,
                              offset: new Offset(10.0, 10.0),
                              blurRadius: 30.0),
                        ],
                        borderRadius: new BorderRadius.circular(30.0),
                        gradient: new LinearGradient(
                            colors: [
                              const Color.fromRGBO(244, 100, 66, 1.0),
                              const Color.fromRGBO(244, 77, 65, 10)
                            ],
                            begin: FractionalOffset.topRight,
                            end: FractionalOffset.bottomLeft,
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp),
                      ),
                      child: new Padding(
                        padding: EdgeInsets.all(20),
                        child: new TextFormField(         
                            decoration: InputDecoration(
                            labelText: 'Filter by name / type / location',
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Roboto'),
                               focusedBorder: UnderlineInputBorder(
                               borderSide:BorderSide(color: Colors.white))),
                          ),
                      )
                    ),
                    )    
                ],
              ),
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("FIND EVENT SCREEN \nIS STILL NOT \nIMPLEMENTED IN OUR APP", style: TextStyle(
                      color: Colors.white,
                      fontSize: 24
                    ))

                  ],
                )

              ],
            )
        ],
      )
    );
  }
}