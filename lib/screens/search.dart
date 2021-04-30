import 'package:flutter/material.dart';

AppBar searchBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      'Search',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 30.0),
    ),
  );
}

Widget search() {
  return Center(child: Text('Search'));
}
