import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth_login_youtube/main.dart';
import '../data/users_id.dart';

class MainPage extends StatefulWidget {

  // MainPage 생성 시 email 을 받아오도록 한다.
  MainPage({this.email});

  final String email;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  Color _color = Colors.orange[200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.email),
        actions: <Widget>[
          // IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   onPressed: () {
          //     print('Shopping cart button is clicked');
          //   },
          // ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button is clicked');
            },
          ),
        ],
      ),
      // DRAWER
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/profile.jpeg'),
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  // backgroundImage: AssetImage('assets/leader.png'),
                  child: Text('☆☆☆',
                    style: TextStyle(color: Colors.black, fontSize: 10.0),),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/team.png'),
                //   backgroundColor: Colors.white,
                // ),
                CircleAvatar(
                  child: Text(
                    '🎸',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  // backgroundImage: AssetImage('assets/part.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text(
                '변현홍',
                style: TextStyle(fontFamily: 'qiannian'),
              ),
              accountEmail: Text(widget.email),
              onDetailsPressed: () {
                print('Detail description is opened.');
              },
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            ListTile(

              leading: Icon(
                Icons.home,
                color: Colors.grey[850],
              ),
              title: Text('Home'),
              // child: Text('Toast')
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(255, 102, 102, 1);
                });
                toastIsAuth();
              },
              // onTap: () {
              //   print('Home Button is clicked.');
              // },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.notifications,
                color: Colors.grey[850],
              ),
              title: Text('Leaders\' 한마디'),
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(255, 133, 51, 1);
                });
                print('Notice Button is clicked.');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.hearing,
                color: Colors.grey[850],
              ),
              title: Text('기도제목'),
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(255, 255, 77, 1);
                });
                print('Pray Button is clicked.');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.book,
                color: Colors.grey[850],
              ),
              title: Text('콘티'),
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(77, 255, 77, 1);
                });
                print('Conti Button is clicked.');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.video_library,
                color: Colors.grey[850],
              ),
              title: Text('참고영상'),
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(77, 166, 255, 1);
                });
                print('Video Button is clicked.');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.import_contacts,
                color: Colors.grey[850],
              ),
              title: Text('악보'),
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(77, 77, 255, 1);
                });
                print('Score Button is clicked.');
              },
              // trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(
                Icons.grid_on,
                color: Colors.grey[850],
              ),
              title: Text('채널표'),
              onTap: () {
                setState(() {
                  _color = Color.fromRGBO(166, 77, 255, 1);
                });
                print('ChannelTable Button is clicked.');
              }
            ),
            ListTile(
            leading: Icon(
            Icons.exit_to_app,
            color: Colors.grey[850],
            ),
            title: Text('Log Out'),
            onTap: () {
              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
              FirebaseAuth.instance.signOut();
            print('Log out.');
            },


              // trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
//      body:
//      Center(
//        child: FlatButton(onPressed: () {
//          FirebaseAuth.instance.signOut();
//
//        },
//
//            child: Text("Log Out"))
    );

  }
}

void toastIsAuth() {
  Fluttertoast.showToast(
      msg: '권한이 없습니다.',
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.redAccent,
      fontSize: 20.0,
      textColor: Colors.white,
      toastLength: Toast.LENGTH_SHORT);
}
