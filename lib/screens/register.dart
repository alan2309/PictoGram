import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static String id = 'register';
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 100, 60, 0),
        child: ListView(
          children: [
            Column(
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  elevation: 0.0,
                  onPressed: () {},
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 100.0,
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
