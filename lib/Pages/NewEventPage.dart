import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportshareapp/BackgroundGradient.dart';
import 'package:sportshareapp/constants/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NewEventPage extends StatefulWidget
{
  NewEventPage({this.uid});
  final String uid;
  @override
  State<StatefulWidget> createState() => _NewEventState();
  
}

class _NewEventState extends State<NewEventPage> {
  List<String> _sports = ['Football', 'Basketball', 'Tennis', 'Volleyball']; // Option 2
  String _eventName, _selectedSport, _creator;
  int _playersValue = 2;
  String _players;

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String _selectedDateValue;

  Future<Null> _selectDate(BuildContext context) async {

    final DateTime picked = await showDatePicker(         
        context: context,
        initialDate: selectedDate, 
        firstDate: DateTime(2015, 8),
        builder: (BuildContext context, Widget child)
        {
          return Theme(
            data: ThemeData.dark(),
            child: child,
          );
        },
        lastDate: DateTime(2101),
      );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

  incrementarPersonas(){
    setState(() {
      if(_playersValue >=2 ){
        _playersValue++;
      }
    });
  }
  void quitarPersonas()
  {
    setState(() {
      if(_playersValue > 2){
        _playersValue--;
      }else{
        return "No puedes poner un numero de jugadores menor a 1.";
      }
    });
  }
    return new Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Column(
                  children: <Widget>[
                Text('Create a New Event  ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Architects'
                  ),
                ),
              ],
            ),
            new Column(
              children: <Widget>[
                Icon(
                  Icons.add
                )
              ],
            )
                ],
              ),
            )   
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: new Form(
        key: _formKey,
        child: new Stack(
          children: <Widget>[
            BackgroundGradient(),
            new Padding(
              padding: EdgeInsets.all(3),
              child:new Card(
                child: new Container(
                  color: Color.fromRGBO(255, 131, 107, 1),
                  child: new ListView(
                  children: <Widget>[
                    Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 10),
                              child: new Column(
                                children: <Widget>[
                                  Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 2),
                              child:new Container(
                                 width: 300,
                                 child: new TextFormField(
                                   onSaved: (input)=> _eventName = input,
                                   validator: (input){
                                     if(input.isEmpty)
                                     {
                                        return 'Please insert a name for the event';
                                     }
                                    },
                                    style: new TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                    labelText: 'Event Name',
                                    labelStyle: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Architects'
                                      )
                                  ),
                                ),
                              ), 
                            )
                          ],
                        ),
                      new Padding(
                        padding:const EdgeInsets.only(top: 30.0),
                        child: new Container(
                          child: new Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.blueGrey
                          ),
                          child: new Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 15),
                                  child: new Column(
                                    children: <Widget>[
                                      Icon(FontAwesomeIcons.footballBall,
                                      color: Colors.white,)
                                    ],
                                  ),
                                ),DropdownButton(
                                      style: TextStyle(color: Colors.white, decorationColor: Colors.white),
                                      hint: Text('Please choose a sport.',
                                      style: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Architects'),
                                    ),
                                    value: _selectedSport,
                                    onChanged: (newValue){
                                      setState(() {
                                        _selectedSport = newValue; 
                                      });
                                    },
                                    items: _sports.map((String sport){
                                      return new DropdownMenuItem<String>(
                                        child: new Text(sport,
                                        style: new TextStyle(
                                        fontFamily: 'Architects',
                                        color: Colors.white),
                                      ),
                                    value: sport
                                    );
                                    }).toList(),
                                  ), 
                              ],
                            ), 
                        )
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0, left: 20),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new Padding(
                            padding: EdgeInsets.only(right: 15),
                            child: new Column(
                            children: <Widget>[
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          ),
                           new Column(      
                            children: <Widget>[
                              new Text('Number of players (max):',
                              style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontFamily: 'Architects'
                              ),)
                            ],
                          ) ,
                        ],
                      )
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: new Card(
                    color: Colors.transparent,
                    child:new Container(
                      padding: EdgeInsets.all(11),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,                               
                                gradient: LinearGradient(
                                  colors: [
                                  const Color.fromRGBO(244, 100, 66, 1.0),
                                  const Color.fromRGBO(244, 77, 65, 10)
                                  ],
                                  begin: FractionalOffset.topRight,
                                  end: FractionalOffset.bottomLeft,
                                )
                              ),                              
                              child: new FloatingActionButton(
                                elevation: 0.0,
                                backgroundColor: Colors.transparent,
                                onPressed:  quitarPersonas,
                                child: new Icon(
                                  Icons.expand_more
                                )
                              ),
                            )
                          ],
                        ),
                        new Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40),
                          child:new Column(
                          children: <Widget>[
                            Text(
                              _players = _playersValue.toString(),
                              style: new TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontFamily: 'Architects',
                              fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ), 
                        ),
                          new Column(
                            children: <Widget>[
                            new Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,                               
                                gradient: LinearGradient(
                                  colors: [
                                  const Color.fromRGBO(244, 100, 66, 1.0),
                                  const Color.fromRGBO(244, 77, 65, 10)
                                  ],
                                  begin: FractionalOffset.topRight,
                                  end: FractionalOffset.bottomLeft,
                                )
                              ),
                              child: new FloatingActionButton(
                                onPressed:  incrementarPersonas,
                                backgroundColor: Colors.transparent,
                                elevation: 0.0,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                                child: new Icon(
                                  Icons.expand_less
                                ),
                              ),
                            )
                          ],
                        ),   
                      ],
                    ),
                  ),
                  )
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 10, left: 20),
                    child: new Row(      
                    children: <Widget>[
                      new Padding(
                        padding: EdgeInsets.only(right: 15),
                        child:new Column(
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                      new Column(
                        children: <Widget>[
                          new Text('Date:',
                          style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontFamily: 'Architects'
                          ),)
                        ],
                      )

                    ],
                  ) ,
                ),
                //Date
                new Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: new  Card( 
                    color: Colors.transparent, 
                    child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(_selectedDateValue = "${selectedDate.day}/${selectedDate.month} / ${selectedDate.year}",
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: 'Architects',
                        fontSize: 20,
                        ),
                      ),
                      new InkWell(
                        onTap: () => _selectDate(context),
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
                          child: new Center(
                            child: new Text(
                              "Select Date",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Architects',
                                  fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  )            
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: new GestureDetector(
                    onTap: () => CreateNewEvent(),
                    child:new Column(
                      children: <Widget>[
                        new Container(
                          height: 100,
                          width: 200,
                          child: new Column(
                            children: <Widget>[
                              new Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                                ),
                                color: Colors.red,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: new Text('CREATE +',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Architects',
                                    color: Colors.white
                                  ),),
                                ), 
                              ),
                            ],
                          ) 
                        ),
                      ],
                    ), 
                  )               
                  )
                ],
                ) , 
                ),
              ),
            )
          ],
        ),
      ),
    );



  }

  CreateNewEvent()
  {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      Firestore.instance.collection("events")
      .document(widget.uid).collection("UserEvents").document()
      .setData({"event_name": _eventName, "type_sport":_selectedSport, "players":_playersValue,"date": _selectedDateValue});

      showDialog(
         context: context,
         builder: (BuildContext context){
           return AlertDialog(
             title: new Text("Event"),
             content: new Text("Event created succesfully"),
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
  }
}