import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPage extends StatelessWidget {

  // MainPage 생성 시 email 을 받아오도록 한다.
  MainPage({this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(email),
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
              accountEmail: Text(email),
              onDetailsPressed: () {
                print('Detail description is opened.');
              },
              decoration: BoxDecoration(
                color: Colors.orange[200],
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
              FirebaseAuth.instance.signOut();
            print('ChannelTable Button is clicked.');
            },


              // trailing: Icon(Icons.add),
            ),
          ],
        ),
      ),
      body:
      Center(
        child: FlatButton(onPressed: () {
          FirebaseAuth.instance.signOut();

        },

            child: Text("Log Out"))),
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
