import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new GradientBack()
      ],
    );
  } 
}

class GradientBack extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
              decoration: new BoxDecoration(
              gradient: new LinearGradient(
              colors: [const Color.fromRGBO(234, 66, 115, 1.0), const Color.fromRGBO(246, 158, 34, 10)],
              begin: FractionalOffset.topRight,
              end: FractionalOffset.bottomLeft,
              stops: [0.0,1.0],
              tileMode: TileMode.clamp
            ),
          ),
    );
  }
}