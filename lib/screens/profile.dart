import 'package:flutter/material.dart';

AppBar profileBar() {
  return AppBar(
    leading: Icon(
      Icons.lock_outlined,
      color: Colors.black,
    ),
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Text(
      'alankrit_19',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),
    ),
    actions: [
      Icon(Icons.add, color: Colors.black),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Icon(Icons.menu, color: Colors.black),
      ),
    ],
  );
}

List<Widget> tabs = [
  Expanded(
    child: Container(
      child: ListView(
        children: [
          Center(
            child: Text(
              "No Posts Yet",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    ),
  ),
  Expanded(
    child: Container(
      child: Center(
          child: Text(
        "No Tags",
        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
      )),
    ),
  ),
];
Widget profile() {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/profile.PNG'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '0',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0),
                    ),
                    Text(
                      'Posts',
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1M',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0)),
                  Text(
                    'Followers',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('1',
                      style: TextStyle(
                          fontWeight: FontWeight.w900, fontSize: 20.0)),
                  Text(
                    'Following',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    'Alankrit Arya',
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
                  Text(
                    '19',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 15.0),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: RaisedButton(
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Colors.black)),
                color: Colors.white,
                onPressed: () {},
                child: Center(child: Text('Edit Profile')),
              ),
            ),
          ],
        ),
        TabBar(tabs: [
          Tab(
            icon: Icon(
              Icons.table_chart_outlined,
              color: Colors.black,
            ),
          ),
          Tab(
            icon: Icon(
              Icons.account_box,
              color: Colors.black,
            ),
          ),
        ]),
        Expanded(child: Container(child: TabBarView(children: tabs))),
      ],
    ),
  );
}
