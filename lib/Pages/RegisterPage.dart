import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../BackgroundGradient.dart';
import 'LoginPage.dart';
import 'package:sportshareapp/auth.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({this.auth});
  final BaseAuth auth;
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
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                          BorderSide(color: Colors.white),   
                                      ),
                              ),
                            ),

                            ///PASSWORD INPUT
                            new TextFormField(
                              validator: (input) {
                                if (input.length < 6) {
                                  return 'Longer password please';
                                }
                              },
                              decoration:
                                  InputDecoration(
                                  labelText: 'Password',
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

                            ///PASSWORD REPEAT INPUT
                            new TextFormField(
                              onSaved: (input) => _passwordRepeat = input,
                              validator: (input) {},
                              decoration:
                                  InputDecoration(
                                  labelText: 'Repeat password',
                                  labelStyle:
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                          BorderSide(color: Colors.white),   
                                      ),
                              ),
                              obscureText: true,
                            ),

                            ///NAME INPUT
                            new TextFormField(
                              onSaved: (input) => _name = input,
                              validator: (input) {},
                              decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle:
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                          BorderSide(color: Colors.white),   
                                      ),
                              ),
                            ),

                            ///SURNAME
                            new TextFormField(
                              onSaved: (input) => _surname = input,
                              validator: (input) {},
                              decoration:
                              InputDecoration(
                                  labelText: 'Surname',
                                  labelStyle:
                                      TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                          BorderSide(color: Colors.white),   
                                      ),
                              ),
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
       String uid = await widget.auth.createUserWithEmailAndPassword(_email, _password);
       AddDataToFireBase(uid,_name, _surname);
       Navigator.pushReplacement( context, MaterialPageRoute(builder: (context) => LoginPage()));
       Navigator.of(context).pop();
      } catch (e) {
        print(e.message);
      }
    }
  }
}

void AddDataToFireBase(String uid,String name, String surname) {
  Firestore.instance.collection("users")
  .document(uid)
  .setData({"name":name, "surname":surname});
}
