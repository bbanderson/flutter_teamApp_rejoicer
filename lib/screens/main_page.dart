import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/screens/login.dart';
import 'package:flutter/gestures.dart';
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

  int _selectedIndex = 1;

  static List<Widget> _widgetOptions = <Widget>[
//    Container(
//      color: Colors.redAccent,
//    ),
//    Container(
//      color: Colors.greenAccent,
//    ),
//    Container(
//      color: Colors.blueAccent,
//    ),
      Center(child: Text('Pneuma Live', textScaleFactor: 3,)),
      Center(child: Text('지금 여의도 날씨는?', textScaleFactor: 3,)),
      Center(child: Text('Chat', textScaleFactor: 3,)),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                Navigator.of(context).pop();
//                toastIsAuth();
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
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
                Navigator.of(context).pop();
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


      body: IndexedStack(
        index: _selectedIndex,
          children: _widgetOptions,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(1),
        child: Icon(Icons.brightness_high),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.live_tv),
                onPressed: () => _onItemTapped(0),

            ),
//            IconButton(
//                icon: Icon(Icons.brightness_high),
//                onPressed: () => _onItemTapped(1),
//            ),
            IconButton(
                icon: Icon(Icons.chat),
                onPressed: () => _onItemTapped(2),
            ),

          ],
        ),
      ),
//      Center(
//        child: FlatButton(onPressed: () {
//          FirebaseAuth.instance.signOut();
//
//        },
//
//            child: Text("Log Out"))
    );

  }

  BottomNavigationBar mainPageButtonNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      unselectedItemColor: Colors.black,
      selectedItemColor: Colors.amber,
      onTap: _onItemTapped,
      currentIndex: _selectedIndex,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.live_tv), title: Text('LIVE')),
        BottomNavigationBarItem(icon: Icon(Icons.brightness_high), title: Text('WEATHER')),
        BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('CHAT')),

      ],
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
