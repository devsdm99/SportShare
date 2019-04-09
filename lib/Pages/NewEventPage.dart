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
  final String _maxPlayers = '10';

  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();

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
      _playersValue++;
      });
    }
  void quitarPersonas()
  {
    setState(() {
      _playersValue--;
    });
  }

    var maxPlayers = _maxPlayers;
    return new Scaffold(
      body: new Form(
        key: _formKey,
        child: new Stack(
          children: <Widget>[
            BackgroundGradient(),
            new ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
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
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ),
                      ),
                      new Padding(
                        padding:const EdgeInsets.only(top: 30.0),
                        child: new Container(
                        width: 300,
                        child: DropdownButton(
                        hint: Text('Please choose a sport.',
                        style: new TextStyle(
                          color: Colors.white
                        ),),
                        value: _selectedSport,
                      onChanged: (newValue){
                        setState(() {
                        _selectedSport = newValue; 
                        });
                      },
                      items: _sports.map((String sport){
                        return new DropdownMenuItem<String>(
                          child: new Text(sport),
                          value: sport,
                          );
                        }).toList(),
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(left: 30.0, top: 30.0),
                  child: new Container(
                    child: new Row(
                      children: <Widget>[
                        new Column(
                          children: <Widget>[
                            new Container(
                              width: 90,
                              height: 90,
                              child: new FloatingActionButton(
                                onPressed:  quitarPersonas,
                                backgroundColor: Colors.red,
                                child: Text('-',
                                style: TextStyle(
                                  fontSize: 70,
                                ),),
                              ),
                            )
                          ],
                        ),
                        new Padding(
                          padding: EdgeInsets.symmetric(horizontal: 50),
                          child: new Column(
                            children: <Widget>[
                              Text(
                                _players = _playersValue.toString(),
                                style: new TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.only(right: 30.0),
                          child:new Column(
                            children: <Widget>[
                            new Container(
                              width: 90,
                              height: 90,
                              child: new FloatingActionButton(
                                onPressed:  incrementarPersonas,
                                backgroundColor: Colors.red,
                                child: new Icon(
                                  Icons.add
                                ),
                              ),
                            )
                          ],
                        ), 
                        )
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("${selectedDate.day}/${selectedDate.month} / ${selectedDate.year}",
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      RaisedButton(
                        onPressed:() => _selectDate(context),
                        child: Text("Select Date"),
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
}