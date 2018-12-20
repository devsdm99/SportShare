import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() => new _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password, _passwordRepeat, _name, _surname;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: new Form(
        key: _formKey,
        child: new Stack(
          children: <Widget>[
            BackgroundGradient(),
            new Center(
              child: new SingleChildScrollView(
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: new Container(
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            ///EMAIL INPUT
                            new TextFormField(
                              validator: (input) {
                                if (input.isEmpty) {
                                  return 'Please type an email';
                                }
                              },
                              onSaved: (input) => _email = input,
                              decoration: InputDecoration(labelText: 'Email'),
                            ),

                            ///PASSWORD INPUT
                            new TextFormField(
                              validator: (input) {
                                if (input.length < 6) {
                                  return 'Longer password please';
                                }
                              },
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              onSaved: (input) => _password = input,
                              obscureText: true,
                            ),

                            ///PASSWORD REPEAT INPUT
                            new TextFormField(
                              onSaved: (input) => _passwordRepeat = input,
                              validator: (input) {},
                              decoration:
                                  InputDecoration(labelText: 'Repeat Password'),
                              obscureText: true,
                            ),

                            ///NAME INPUT
                            new TextFormField(
                              onSaved: (input) => _name = input,
                              validator: (input) {},
                              decoration: InputDecoration(labelText: 'Name'),
                            ),

                            ///SURNAME
                            new TextFormField(
                              onSaved: (input) => _surname = input,
                              validator: (input) {},
                              decoration: InputDecoration(labelText: 'Surname'),
                            ),
                            //REGISTER BUTTON
                            new InkWell(
                              onTap: signUp,
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
                                    "Register",
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
            )
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}