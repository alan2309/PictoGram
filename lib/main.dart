import 'package:PictoGram/screens/display.dart';
import 'package:PictoGram/screens/login.dart';
import 'package:PictoGram/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Picto());
}

class Picto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      routes: {
        Register.id: (context) => Register(),
        Display.id: (context) => Display(),
      },
      debugShowCheckedModeBanner: false,
      title: 'PictoGram',
      home: Display(),
    );
  }
}
