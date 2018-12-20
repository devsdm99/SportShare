import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sportshareapp/BackgroundGradient.dart';

class UploadPicturePage extends StatefulWidget
{
  _UploadPicturePageState createState() => new _UploadPicturePageState();

}

class _UploadPicturePageState extends State<UploadPicturePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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