import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sportshareapp/BackgroundGradient.dart';

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
  int _playersValue = 1;
  String _players;
  final int _maxPlayers = 10;

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  String _selectedDateValue;
  Text _selectedSportt = Text('Please choose a sport');

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
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
      if(_playersValue < _maxPlayers){
        _playersValue++;
      }
    });
  }
  void quitarPersonas()
  {
    setState(() {
      if(_playersValue > 1){
        _playersValue--;
      }else{
        return "No puedes poner un numero de jugadores menor a 1.";
      }
    });
  }
    return new Scaffold(
      body: new Form(
        key: _formKey,
        child: new Stack(
          children: <Widget>[
            BackgroundGradient(),
            new ListView(
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                          margin: new EdgeInsets.only(
                          top: 30.0, left: 20.0, right: 20, bottom: 20),
                          height: 100.0,
                          width: 300.0,
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
                                begin: FractionalOffset.topCenter,
                                end: FractionalOffset.bottomCenter,
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: new Center(
                            child: new Text('New event screen',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Architects'
                            ),
                            ),
                          ),
                        ),
                    ],
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 60.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Container(
                        width: 300,
                        child: new TextFormField(
                          onSaved: (input)=> _eventName = input,
                          validator: (input){
                            if(input.isEmpty)
                            {
                              return 'Please insert a name for the event';
                            }
                          },
                          style: new TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: 'Event Name',
                            labelStyle: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Architects'
                            )
                          ),
                        ),
                      ),
                      new Padding(
                        padding:const EdgeInsets.only(top: 30.0),
                        child: new Container(
                        width: 300,
                        child: new Theme(
                          data: Theme.of(context).copyWith(
                            canvasColor: Colors.blueGrey
                          ),
                          child: DropdownButton(
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
                        )
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: new Column(
                    children: <Widget>[
                      new Text('Players',
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontFamily: 'Architects'

                      ),)
                    ],
                  ),

                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,                               
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
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,                               
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
                ),
                //Date
                new Padding(
                  padding: EdgeInsets.only(top: 30.0),
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
                      SizedBox(height: 20.0,),
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
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0, bottom: 10.0),
                  child: new Column(
                      children: <Widget>[
                      new Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,                               
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
                          onPressed:  () => CreateNewEvent(_eventName, _selectedSport, _playersValue, _selectedDateValue, widget.uid),
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),
                          child: new Text('Finish',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Architects'
                            ),),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );



  }

  CreateNewEvent(String eventName, String selectedSport, int players, String selectedDateValue, String uid )
  {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      Firestore.instance.collection("events")
      .document(uid)
      .setData({"event_name":eventName, "type_sport":selectedSport, "players":players,"date": selectedDateValue});
    }
  }
}