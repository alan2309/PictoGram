import 'package:flutter/material.dart';

AppBar homeBar() {
  return AppBar(
    backgroundColor: Colors.white,
    title: Center(
      child: Text(
        'PictoGram',
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Pacifico',
          fontWeight: FontWeight.w400,
          fontSize: 27.0,
        ),
      ),
    ),
    leading: GestureDetector(
      onTap: () {
        print("add story");
      },
      child: Icon(
        Icons.camera_alt_outlined,
        color: Colors.black,
        size: 35.0,
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(right: 10.0),
        child: GestureDetector(
            onTap: () {
              print("message");
            },
            child: Icon(
              Icons.send,
              color: Colors.black,
              size: 30.0,
            )),
      )
    ],
  );
}

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<Widget> story = [
    Container(
      padding: EdgeInsets.only(left: 10),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/profile.PNG'),
            radius: 35,
          ),
          Icon(Icons.add_circle, color: Colors.blue)
        ],
      ),
    )
  ];
  bool isLiked = false;
  void getStory() {
    for (int i = 0; i < 8; i++) {
      story.add(
        Stack(
          alignment: Alignment(0, 0),
          children: [
            Icon(
              Icons.circle,
              size: 90,
              color: Colors.red,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/profile.PNG'),
              radius: 35,
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getStory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: story,
                  ),
                ),
              )
            ],
          ),
          Posts(
              isLiked: isLiked,
              onPressed: () {
                setState(() {
                  if (isLiked)
                    isLiked = false;
                  else
                    isLiked = true;
                });
              }),
          Posts(
              isLiked: isLiked,
              onPressed: () {
                setState(() {
                  if (isLiked)
                    isLiked = false;
                  else
                    isLiked = true;
                });
              }),
          Posts(
              isLiked: isLiked,
              onPressed: () {
                setState(() {
                  if (isLiked)
                    isLiked = false;
                  else
                    isLiked = true;
                });
              }),
          Posts(
              isLiked: isLiked,
              onPressed: () {
                setState(() {
                  if (isLiked)
                    isLiked = false;
                  else
                    isLiked = true;
                });
              }),
          Posts(
              isLiked: isLiked,
              onPressed: () {
                setState(() {
                  if (isLiked)
                    isLiked = false;
                  else
                    isLiked = true;
                });
              }),
        ],
      ),
    );
  }
}

class Posts extends StatelessWidget {
  final bool isLiked;
  final Function onPressed;
  Posts({this.isLiked, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10.0),
                      child: CircleAvatar(
                        backgroundImage: AssetImage('images/profile.PNG'),
                      ),
                    ),
                    Text(
                      'alankrit_19',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
              ],
            ),
          ),
          Container(
            constraints: BoxConstraints(maxWidth: 350),
            child: Image(
              image: AssetImage('images/profile.PNG'),
            ), //use decoration image while using post object
          ),
          Row(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment(0, 0),
                    children: [
                      Icon(
                        Icons.favorite_border,
                        size: 30,
                      ),
                      IconButton(
                        onPressed: onPressed,
                        icon: Icon(Icons.favorite,
                            size: 25,
                            color: isLiked ? Colors.red : Colors.white),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.message_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.send_outlined,
                    color: Colors.black,
                    size: 30,
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              '1,00,000 liked your post',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
