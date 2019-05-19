import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sportshareapp/BackgroundGradient.dart';
import 'package:sportshareapp/Widgets/EventWidget.dart';

class EventListPage extends StatefulWidget{
  EventListPage();

    String nombre;
  _EventListPage createState() => _EventListPage();
}

class _EventListPage extends State<EventListPage>{

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


  @override
  Widget build(BuildContext context) {
    
    double widthScreen = MediaQuery.of(context).size.width;
    
        // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Events List",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Architects'
        ),),
      ),
      body: new Stack(
        children: <Widget>[
          BackgroundGradient(),
          Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                Container(
                  height: 100,
                  width: widthScreen,
                  color: Colors.red,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Text("Welcome to SportShare: ")
                    ],
                  ),
                ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
            future: getEvents(),
            builder: (_,snapshot)
            {
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return Center(
                  child: Text("Cargando eventos..",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Architects'
                  ),),
                );
              }else{
                return ListView.builder(
                  itemCount: snapshot.data.length ,
                  itemBuilder: (_,index){
                    return ListTile(
                      title: new EventWidget(event_name: snapshot.data[index]["event_name"],players: snapshot.data[index]["players"], eventDate: snapshot.data[index]["date"], typeSport: snapshot.data[index]["type_sport"], admin: snapshot.data[index]["admin"] )
                    );
                });
              }
            }
          ),
          )
            ],
          ),

        ],
      )
    );
  }
}