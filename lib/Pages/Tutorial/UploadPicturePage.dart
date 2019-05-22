import 'package:flutter/material.dart';

class UploadPicturePage extends StatefulWidget
{
  _UploadPicturePageState createState() => new _UploadPicturePageState();
}

class _UploadPicturePageState extends State<UploadPicturePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Form(
        child: new Container(
          child: new Column(
            children: <Widget>[
              Text("Hola Mundo")
            ],
          ),
        ),
      ),
    );
  }
}