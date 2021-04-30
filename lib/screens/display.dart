import 'package:PictoGram/screens/upload.dart';
import 'package:flutter/material.dart';
import 'package:PictoGram/screens/home.dart';
import 'package:PictoGram/screens/profile.dart';
import 'package:PictoGram/screens/recent.dart';
import 'package:PictoGram/screens/search.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Display extends StatefulWidget {
  static String id = 'display';
  @override
  _DisplayState createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  int _current = 0;
  final _auth = FirebaseAuth.instance;
  User loggedInUser;
  void initState() {
    super.initState();
    getCurrentUser();
    print(loggedInUser.email);
  }

  final _tabs = [
    home(),
    search(),
    ImageUpload(),
    activity(),
    profile(),
  ];
  final _appbars = [
    homeBar(),
    searchBar(),
    null,
    activityBar(),
    profileBar(),
  ];
  void getCurrentUser() {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbars[_current],
      body: _tabs[_current],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _current,
        onTap: (index) {
          setState(() {
            _current = index;
          });
        },
        iconSize: 30.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            title: Text(
              'Home',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            title: Text(
              'search',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            title: Text(
              'image',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border_outlined,
            ),
            title: Text(
              'Recents',
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
            ),
            title: Text(
              'Profile',
            ),
          ),
        ],
      ),
    );
  }
}
