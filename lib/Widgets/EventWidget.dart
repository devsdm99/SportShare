import 'package:flutter/material.dart';

class EventWidget extends StatefulWidget
{
  EventWidget({this.event_name, this.players, this.typeSport, this.eventDate, this.admin});
  
  String event_name, typeSport, eventDate, admin;
  int players;

  String joinedString = "Join";
  bool joined = false;
  _EventState createState() => _EventState();
}

class _EventState extends State<EventWidget>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: new Card(
        color: Color.fromRGBO(255, 131, 107, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: new Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
                child: new Text(
                  widget.event_name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Architects',
                  ),
              ), 
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.all(10),
                        child: new Row(
                          children: <Widget>[
                            Text('Sport: ',
                              style: TextStyle(
                                fontFamily: 'Architects',
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(widget.typeSport,
                              style: TextStyle(
                                fontFamily: 'Architects',
                              ),
                            ),
                          ],
                        )
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: new Row(
                          children: <Widget>[
                            Text('Max Players: ',
                              style: TextStyle(
                                fontFamily: 'Architects',
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(widget.players.toString(),
                              style: TextStyle(
                                fontFamily: 'Architects',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: new Row(
                          children: <Widget>[
                            Text('Event date: ',
                              style: TextStyle(
                                fontFamily: 'Architects',
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(widget.eventDate,
                              style: TextStyle(
                                fontFamily: 'Architects',
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child:new InkWell(
                onTap: ChangeCurrentState,
                child: new Container(
                  margin: new EdgeInsets.only(
                  top: 30.0, left: 20.0, right: 20, bottom: 20),
                  height: 40.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                          color: Colors.black,
                          offset: new Offset(10.0, 10.0),
                          blurRadius: 10.0),
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
                  child: new Center(
                    child: new Text(
                      widget.joinedString,
                      style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Architects',
                          fontSize: 16.0),
                    ),
                  ),
                ),
              ), 
            ),
          ],
        ),
      ),
    );
  }

  ChangeCurrentState() async{
    
    String joineds;
    if(!widget.joined)
    {
      widget.joined = true;
      joineds = "Joined";
    }else
    {
      widget.joined = false;
      joineds = "Join";
    }

    setState(() {
      widget.joinedString = joineds;
    });
  }
}