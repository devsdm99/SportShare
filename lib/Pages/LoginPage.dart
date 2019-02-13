import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
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
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white))),
                            ),
                            new TextFormField(
                              ///PASSWORD INPUT
                              validator: (input) {
                                if (input.length < 6) {
                                  return 'Longer password please';
                                }
                              },
                              decoration: InputDecoration(
                                  labelText: 'PASSWORD',
                                  labelStyle:
                                      TextStyle(fontWeight: FontWeight.bold),
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
                                    top: 30.0, left: 20.0, right: 20),
                                height: 50.0,
                                width: 230.0,
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
                                        fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ),
                            new InkWell(
                              //REGISTER BUTTON
                              onTap: signUp,
                              child: new Container(
                                margin: new EdgeInsets.only(
                                    top: 30.0, left: 20.0, right: 20),
                                height: 30.0,
                                width: 140.0,
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
                                    "Registrate aqui!",
                                    style: new TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.0),
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
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePage(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }

  void signUp() async {
    try {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    } catch (e) {
      print(e.message);
    }
  }
}
