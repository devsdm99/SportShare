import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget
{
  EventWidget({this.event_name, this.players, this.typeSport, this.eventDate, this.admin});
  
  String event_name, typeSport, eventDate, admin;
  int players;
  _EventState createState() => _EventState();
}

class _EventState extends State<EventWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: new Card(
        child: new Column(
          children: <Widget>[
            Text(widget.players.toString())
          ],
        ),
      ),
    );
  }
}

