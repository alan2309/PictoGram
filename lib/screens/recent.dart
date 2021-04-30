import 'package:flutter/material.dart';

AppBar activityBar() {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.white,
    title: Text(
      'Activity',
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25.0),
    ),
  );
}

Widget activity() {
  return ListView(
    children: [
      ListTile(
        leading: FloatingActionButton(
          elevation: 1.0,
          onPressed: () {},
          backgroundColor: Colors.white,
          child: Icon(
            Icons.person_add_outlined,
            size: 30.0,
            color: Colors.black54,
          ),
        ),
        title: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Text('Follow Requests')),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Approve or ignore requests',
                style: TextStyle(color: Colors.black54),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
        child: Text(
          'Today',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
        ),
      ),
      FollowTile(),
      FollowTile(),
      FollowTile(),
      FollowTile(),
      FollowTile(),
      Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
        child: Text(
          'This week',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.0),
        ),
      ),
      FollowTile(),
      FollowTile(),
      FollowTile(),
      FollowTile(),
    ],
  );
}

class FollowTile extends StatelessWidget {
  const FollowTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25.0,
        backgroundImage: AssetImage('images/srk.jpg'),
      ),
      title: Wrap(
        children: [
          Text(
            'iamsrk',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(' started '),
          Text('following you.'),
          Text(
            '4d',
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
      trailing: RaisedButton(
        color: Colors.blueAccent,
        onPressed: () {},
        child: Text('Follow'),
      ),
    );
  }
}
