import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'package:sportshareapp/auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});//parametros de esta clase

  final BaseAuth auth;
  final VoidCallback onSignedIn;
  
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
//VARIABLEEES
  String _email, _password;
  
  final logo = Image.asset(
    "assets/logoappCN.png",
    width: 220.0,
    height: 220.0,
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Form(
        key: _formKey,
        child: new Stack(
          children: <Widget>[
            new BackgroundGradient(),
            new Center(
              child: new SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
                      child: logo,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: new Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            new TextFormField(
                              ///EMAIL INPUT
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type an email';
                                }
                              },
                              onSaved: (input) => _email = input,
                              decoration: InputDecoration(
                                  labelText: 'EMAIL',
                                  labelStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                            new TextFormField(
                              ///PASSWORD INPUT
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Type a password please';
                                }
                              },
                              decoration:
                               InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle:
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                          BorderSide(color: Colors.white),   
                                      ),
                              ),
                              onSaved: (input) => _password = input,
                              obscureText: true,
                            ),
                            new InkWell(
                              //LOGIN BUTTON
                              onTap: signIn,
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
                                        const Color.fromRGBO(234, 66, 115, 1.0),
                                        const Color.fromRGBO(246, 158, 34, 10)
                                      ],
                                      begin: FractionalOffset.topRight,
                                      end: FractionalOffset.bottomLeft,
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: new Center(
                                  child: new Text(
                                    "LOGIN",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    'o',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            new InkWell(
                              //REGISTER BUTTON
                              onTap: signUp,
                              child: new Container(
                                margin: new EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20),
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
                                        const Color.fromRGBO(234, 66, 115, 1.0),
                                        const Color.fromRGBO(246, 158, 34, 10)
                                      ],
                                      begin: FractionalOffset.topRight,
                                      end: FractionalOffset.bottomLeft,
                                      stops: [0.0, 1.0],
                                      tileMode: TileMode.clamp),
                                ),
                                child: new Center(
                                  child: new Text( "Do not have account?",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
      widget.onSignedIn();
     //LOGIN    
      Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(uid: userId)));
    }

  }

  void signUp() async {
    try {
      Navigator.push( context, MaterialPageRoute(builder: (context) => RegisterPage(auth: widget.auth,)));
    } catch (e) {
      print(e.message);
    }
  }
}
