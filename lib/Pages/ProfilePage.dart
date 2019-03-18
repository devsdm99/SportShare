import 'package:flutter/material.dart';

import 'package:sportshareapp/BackgroundGradient.dart';
class ProfilePage extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => _ProfilePageState();
  

}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Stack(
        children: <Widget>[
          new BackgroundGradient(),
          new Text(
            'ESE'
          )
        ],
      ),
    );
  }
}