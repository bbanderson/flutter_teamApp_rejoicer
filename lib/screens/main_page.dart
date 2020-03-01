import 'dart:ui';
import 'package:english_words/english_words.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/bloc/favoriteConti.dart';
import 'package:firebase_auth_login_youtube/bloc/new_conti.dart';
import 'package:firebase_auth_login_youtube/bloc/random_list.dart';
import 'package:firebase_auth_login_youtube/bloc/saved.dart';
import 'package:firebase_auth_login_youtube/data/profileImage.dart';
import 'package:firebase_auth_login_youtube/screens/Conti/addConti.dart';
import 'package:firebase_auth_login_youtube/screens/login.dart';
import 'package:firebase_auth_login_youtube/screens/mainPage_drawer_contents/channels.dart';
import 'package:firebase_auth_login_youtube/screens/socket/socket_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

//import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth_login_youtube/main.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../data/users_id.dart';

class MainPage extends StatefulWidget {
  // MainPage 생성 시 email 을 받아오도록 한다.
  MainPage({this.email});

  final String email;

  static BuildContext get context => null;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
//  String userName = instTeam;

//  @override
//  void init() {
//    super.initState();
//    String userID = email;
//  }

  Color _color = Colors.orange[200];
  Color _appBarColor = Colors.amber;
  Text _appBarText = Text('Home');
  static String _contiDate = '2020년 02월 14일';

//  Text _sliverTitle = Text('오늘의 여의도 날씨는?');

  int _selectedIndex = 1;

  int duration = 2;
  Widget currentWidget = progress;
  bool isProgressed = true;

  // bottonNav 누를 때 변경 사항 저장하기 -> live, weather, chat Page
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
    Center(
        child: Text(
      'Pneuma Live',
      textScaleFactor: 2,
    )),
    Center(
        child: Text(
      _contiDate,
      textScaleFactor: 2,
    )),
    Center(
        child: Text(
      'Chat',
      textScaleFactor: 2,
    )),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var userData = emailToConfig[widget.email];

    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        centerTitle: true,
//        backgroundColor: _appBarColor,
//        title: _appBarText,
//        actions: <Widget>[
//          // IconButton(
//          //   icon: Icon(Icons.shopping_cart),
//          //   onPressed: () {
//          //     print('Shopping cart button is clicked');
//          //   },
//          // ),
////          IconButton(
////            icon: Icon(Icons.search),
////            onPressed: () {
////              print('Search button is clicked');
////            },
////          ),
//          IconButton(
//            icon: Icon(Icons.list),
//            onPressed: () {
////              Navigator.of(context).push(MaterialPageRoute(
////                  builder: (context) => SavedList(saved: )));
//            },
//          )
//        ],
//      ),
      // DRAWER
      drawer: Drawer(
        child: CupertinoScrollbar(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('https://picsum.photos/200/300'),
                ),
                otherAccountsPictures: <Widget>[
                  CircleAvatar(
                    // backgroundImage: AssetImage('assets/leader.png'),
                    child: userData.isLeader
                        ? Text(
                            '☆☆☆',
                            style:
                                TextStyle(color: Colors.black, fontSize: 10.0),
                          )
                        : Text('☆'),
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
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.edit),
                    onPressed: () {
//                    Navigator.of(context).
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileImage()));
                    },
                  ),
                ],
                accountName: Text(
                  emailToName[widget.email],
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
                    _color = Colors.amber[200];
                    _appBarColor = Colors.amber;
                    _appBarText = Text('Home');
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
                    //255, 133, 51, 1
                    _color = Color.fromRGBO(255, 102, 102, 1);
                    _appBarColor = Color.fromRGBO(255, 102, 102, 1);
                    _appBarText = Text('Leaders\' 한마디');
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
                    _color = Colors.yellow;
                    _appBarColor = Colors.yellow;
                    _appBarText = Text('기도제목');
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
                    _color = Colors.green;
                    _appBarColor = Colors.green;
                    _appBarText = Text('콘티');
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
                    _appBarColor = Color.fromRGBO(77, 166, 255, 1);
                    _appBarText = Text('참고영상');
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
                    _appBarColor = Color.fromRGBO(77, 77, 255, 1);
                    _appBarText = Text('악보');
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
                    setState(() async {
                      _color = Color.fromRGBO(166, 77, 255, 1);
                      _appBarColor = Color.fromRGBO(166, 77, 255, 1);
                      _appBarText = Text('채널표');
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Channel(email: widget.email)));
                    });
                    Navigator.of(context).pop();
                    print('ChannelTable Button is clicked.');
                  }),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 1,
                child: Container(
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                trailing: Icon(
                  Icons.exit_to_app,
                  color: Colors.grey[850],
                ),
                title: Text(
                  'Log Out',
                  textAlign: TextAlign.end,
                ),
                onTap: () {
                  //    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
                  FirebaseAuth.instance.signOut();
//                  Navigator.pop(context);
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => AuthPage()));
                  print('Log out.');
                },

                // trailing: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),

      body: myCustomScrollView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _onItemTapped(1);
          setState(() {
            isProgressed = !isProgressed;
            currentWidget = isProgressed ? progress : layout;
          });
        },
        child: Text(
          '🎶',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
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
              onPressed: () {
                _onItemTapped(2);
//                  return SocketChat();
              },
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

  CustomScrollView myCustomScrollView() {
    final Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          actions: <Widget>[
            IconButton(
              icon: FaIcon(
                FontAwesomeIcons.pencilAlt,
                color: Colors.grey[850],
              ),
              iconSize: 20,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddConti()));
              },
            ),

//            IconButton(
//              icon: Icon(Icons.list),
//              onPressed: () {
//                Navigator.of(context).push(MaterialPageRoute(
//                    builder: (context) =>
//                        FavoriteConti(saved: NewContiList().goToSave)));
//              },
//            )
          ],
          elevation: 0,
          automaticallyImplyLeading: true,
          floating: true,
          pinned: true,
          snap: false,
          backgroundColor: Colors.white,
          expandedHeight: size.height * 0.5,
//          title: Text('d'),
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Weekly Conti',
              style: TextStyle(
                letterSpacing: 3,
              ),
            ),
            centerTitle: true,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: <Widget>[
                  IndexedStack(
                    index: _selectedIndex,
                    children: _widgetOptions,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
//            child: SocketChat(),
                  ),
                ],
              ),
              Container(
                color: Colors.amber,
                height: size.height * 0.5,
                child: NewContiList(),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: (AnimatedSwitcher(
                    duration: Duration(seconds: duration),
                    child: currentWidget,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    switchInCurve: Cubic(0.22, 0.0, 1.0, 1.0),
                    switchOutCurve: Cubic(0.0, 0.0, 0.28, 1.0),
                  )),
                ),
                color: Colors.green,
                height: 250,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: (AnimatedSwitcher(
                    duration: Duration(seconds: duration),
                    child: currentWidget,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    switchInCurve: Cubic(0.22, 0.0, 1.0, 1.0),
                    switchOutCurve: Cubic(0.0, 0.0, 0.28, 1.0),
                  )),
                ),
                color: Colors.blue,
                height: 250,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: (AnimatedSwitcher(
                    duration: Duration(seconds: duration),
                    child: currentWidget,
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                      return ScaleTransition(
                        scale: animation,
                        child: child,
                      );
                    },
                    switchInCurve: Cubic(0.22, 0.0, 1.0, 1.0),
                    switchOutCurve: Cubic(0.0, 0.0, 0.28, 1.0),
                  )),
                ),
                color: Colors.black,
                height: 250,
              ),
            ],
          ),
        ),
      ],
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
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_high), title: Text('WEATHER')),
        BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('CHAT')),
      ],
    );
  }
}

//void toastIsAuth() {
//  Fluttertoast.showToast(
//      msg: '권한이 없습니다.',
//      gravity: ToastGravity.BOTTOM,
//      backgroundColor: Colors.redAccent,
//      fontSize: 20.0,
//      textColor: Colors.white,
//      toastLength: Toast.LENGTH_SHORT);
//}

Widget progress = Container(
  key: ValueKey(0),
  color: Colors.amber[50],
  child: ListTile(
    leading: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
    ),
    title: Text('잠시만 기다려주세요'),
    subtitle: Text('loading...'),
  ),
);

//Widget layout = Container(
//  key: ValueKey(1),
//  color: Colors.blue[50],
//  child: SizedBox(
//    height: 40,
//  ),
//);

Widget layout = Container(
  key: ValueKey(1),
  color: Colors.blue[50],
  child: ListTile(
    leading: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
    ),
    title: Text('잠시만 기다려주세요'),
    subtitle: Text('loading...'),
  ),
);
//class SavedList extends StatelessWidget {
//  SavedList({@required this.saved});
//
//  final Set<WordPair> saved;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Saved'),
//      ),
//    );
//  }
//}

//class Splash extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return StreamBuilder<FirebaseUser>(
//        stream: FirebaseAuth.instance.onAuthStateChanged,
//        builder: (context, snapshot) {
//
//          if (snapshot.data == null) {
//            return ChangeNotifierProvider<GuestOrRejoicer>.value(
//                value: GuestOrRejoicer(),
//                child: AuthPage());
//          } else {
////          String realName = snapshot.data.email.toString();
//            return MainPage(email: snapshot.data.email);
//          }
//        }
//    );
//  }
//}
