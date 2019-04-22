import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportshareapp/Widgets/EventWidget.dart';

class EventListPage extends StatefulWidget{
  EventListPage();

    String nombre;
  _EventListPage createState() => _EventListPage();
}

class _EventListPage extends State<EventListPage>{

  Future getEvents() async {
    var firestore = Firestore.instance;
    QuerySnapshot qn = await firestore.collection("events").getDocuments();

    return qn.documents;
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ESEE"),
      ),
      body: FutureBuilder(
              future: getEvents(),
              builder: (_,snapshot)
              {
                if(snapshot.connectionState == ConnectionState.waiting)
                {
                  return Center(
                    child: Text("Cargando productos.."),
                  );
                }else{
                  return ListView.builder(
                    itemCount:snapshot.data.length ,
                    itemBuilder: (_,index){
                      return ListTile(
                        title: new EventWidget(event_name: snapshot.data[index]["event_name"],players: snapshot.data[index]["players"], eventDate: snapshot.data[index]["date"], typeSport: snapshot.data[index]["type_sport"], admin: snapshot.data[index]["admin"] )
                      );
                  });
                }
              }
        ),
    );
  }


}