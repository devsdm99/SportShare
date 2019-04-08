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
    return new Scaffold(
      body: new Form(
        key: _formKey,
        child: new Stack(
        children: <Widget>[
            BackgroundGradient(),
            new Center(
              child: SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Container(
                      width: 300,
                      child: new TextFormField(
                      onSaved: (input) => _eventName = input,
                      validator: (input) {
                        if(input.isEmpty)
                          return 'Please enter some text';
                      },
                      style: new TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                      labelText: 'Event Name:',
                      labelStyle: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))), 
                  ),
                  ),
                  ),
                  new Padding(
                    padding:const EdgeInsets.only(top: 20.0),
                    child: new Container(
                     width: 300,
                     child: DropdownButton(
                      hint: Text('Please choose a sport.'),
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
                    new Container(
                      width: 300,
                      child: new TextFormField(
                      onSaved: (input) => _eventName = input,
                      validator: (input) {
                        if(input.isEmpty)
                          return 'Please enter some text';
                      },
                      style: new TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                      labelText: 'Max players:',
                      labelStyle: new TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))), 
                    ),
                  ),  
                  ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}