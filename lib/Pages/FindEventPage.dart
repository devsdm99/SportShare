import 'package:flutter/material.dart';

import '../BackgroundGradient.dart';
class FindEventPage extends StatefulWidget{

  _FindEventPage createState() => _FindEventPage();

}

class _FindEventPage extends State<FindEventPage> {
  @override
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
                        fontFamily: 'Architects'
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
          new Row(
            children: <Widget>[
              new TextFormField(
                validator: (input) {
              if (input.isEmpty) {
                return 'Please type an email';
              }
            },
            //onSaved: (input) => _email = input,
            decoration: InputDecoration(
                labelText: 'Find for event sport',
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
                focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.white))),
              ),
            ],
          )
        ]
      )
    );
  }

}