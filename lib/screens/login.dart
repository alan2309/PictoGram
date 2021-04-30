import 'package:PictoGram/screens/display.dart';
import 'package:PictoGram/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

const TextStyle kLightText = TextStyle(color: Colors.black54, fontSize: 13.0);
const TextStyle kDarkText =
    TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0);

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _auth = FirebaseAuth.instance;
  bool _showSpinner = false;
  String email;
  String pass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Center(
          child: Text(
            'English(india) ^',
            style: TextStyle(color: Colors.black45, fontSize: 15),
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 70, 20, 0),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PictoGram',
                    style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontWeight: FontWeight.w200,
                        fontSize: 40),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.grey.shade100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Phone number,email or username',
                        hintStyle: TextStyle(color: Colors.black54),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.grey.shade100,
                    child: TextField(
                      obscureText: true,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                        pass = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        hintStyle: TextStyle(color: Colors.black54),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      RaisedButton(
                        color: Colors.blue[500],
                        onPressed: () async {
                          try {
                            setState(() {
                              _showSpinner = true;
                            });
                            final user = await _auth.signInWithEmailAndPassword(
                                email: email, password: pass);
                            if (user != null) {
                              Navigator.pushNamed(context, Display.id);
                            }
                            setState(() {
                              _showSpinner = false;
                            });
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Forgotten your login details?',
                        style: kLightText,
                      ),
                      Text(
                        'Get help with logging in.',
                        style: kDarkText,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.account_circle, color: Colors.blue[600]),
                        Text(
                          'Log In With Facebook',
                          style: TextStyle(
                              color: Colors.blue[500],
                              fontWeight: FontWeight.w700,
                              fontSize: 15),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: kLightText,
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, Register.id);
            },
            child: Text(
              'Sign up',
              style: kDarkText,
            ),
          )
        ],
      ),
    );
  }
}
