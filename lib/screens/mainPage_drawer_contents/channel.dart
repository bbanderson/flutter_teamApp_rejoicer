import 'dart:ui';

import 'package:firebase_auth_login_youtube/data/channel_saved_data.dart';
import 'package:flutter/material.dart';

class Channel extends StatefulWidget {
  @override
  _ChannelState createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {

  int channelIndex = 0;
  List channels;

  @override
  void initState() {

    super.initState();
    channels = [singerList()];
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('채널표'),
          backgroundColor: Colors.purpleAccent,
        ),
        body: Container(
          height: size.height,
          child: Column(
            children: <Widget>[
              Container(
                height: size.height * 0.1,
                child: Card(
                  elevation: 0,
                    child: Flex(
                  mainAxisSize: MainAxisSize.min,
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: RaisedButton(
                              child: Text(
                                'Singer',
                                style: TextStyle(fontSize: 11),
                              ),
                              onPressed: () {
                                context:

                                _onItemTapped(0);

//                                channelSaved.changeChannelList(item)
                                setState(() {
//                                channelIndex = 0;
//                                channelSaved.savedStream;
                                channels[0] = singerList();
                              }
                              );
                              },
                            ),
                    ),
                    Container(
                      width: size.width * 0.2,
                      child: RaisedButton(
                          child: Text('E.G/Bass',
                            style: TextStyle(fontSize: 11),
                          ),
                          onPressed: () {
                            _onItemTapped(0);

                            setState(() {
//                              channelIndex = 1;
//                            show.removeLast();
//                            show.add(channels[channelIndex]);
                              channels[0] = guitarList();
                            });
                          }),
                    ),
                    Container(
                      width: size.width * 0.2,
                      child: RaisedButton(
                          child: Text('Keys',
                            style: TextStyle(fontSize: 11),
                          ),
                          onPressed: () {
                            _onItemTapped(0);
                            setState(() {
                              channels[0] = keysList();
//                              channelIndex = 2;
                              print(channels[channelIndex]);
                            });
                          }),
                    ),
                    Container(
                      width: size.width * 0.2,
                      child: RaisedButton(
                          child: Text('Drum',
                            style: TextStyle(fontSize: 11),
                          ),
                          onPressed: () {
                            _onItemTapped(0);
                            setState(() {
                              channels[0] = drumList();

//                              channelIndex = 3;
//                              print(channels[channelIndex]);
                            });
                          }),
                    ),
                  ],
                )),
              ),
              SizedBox(
                child: Container(
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                ),
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.5,
                child: Card(
                  color: Colors.amber[200],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: channels[0],
                  ),
                ),
              ),
              SizedBox(
                child: Container(
                  color: Colors.grey[300],
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                ),
                height: size.height * 0.03,
              ),
              Container(
                height: size.height * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'from Mic',
                            style: TextStyle(),
                            textAlign: TextAlign.center,
                          ),
                          Text('s')
                        ],
                      ),
                      width: size.width * 0.38,
                      color: Colors.red,
                    ),
                    Container(
                      child: Icon(Icons.arrow_forward),
                    ),
                    Container(
                      child: Text(
                        'to Roll',
                        style: TextStyle(),
                        textAlign: TextAlign.center,
                      ),
                      width: size.width * 0.38,
                      color: Colors.blue,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
  
  Widget _onItemTapped(int index) {
    setState(() {
      channelIndex = index;
    });
    return channels[channelIndex];
  }
}


Widget singerList() {
  return ListView(
    padding: EdgeInsets.all(10),
    scrollDirection: Axis.vertical,
    children: <Widget>[
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            '인도자',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : Singer Box'),
          onTap: () {
//                            setState(() {});
            print('인도자 Button is clicked.');
          }),
//                    Divider(),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            '목사님',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : Singer Box - Beta 87A'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Snare Button is clicked.');
          }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Hi-Hat',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Hi-Hat Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Tom 1',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box - Mini'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Tom 1 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Tom 2',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box - Mini'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Tom 2 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Tom 3',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box - Mini'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Tom 3 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Over Head 1',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Over Head 1 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Over Head 2',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Over Head 2 Button is clicked.');
//            }),
//                      Container(
//                        child: RaisedButton(
//                          color: Colors.amber,
//                          onPressed: () {},
//                        ),
//                      ),

//                      Container(
//                        color: Colors.green,
//                      ),
//                      Container(
//                        color: Colors.blue,
//                      ),
    ],
//              magnification: 2,
    itemExtent: 50.0,
  );
}

Widget guitarList() {
  return ListView(
    padding: EdgeInsets.all(10),
    scrollDirection: Axis.vertical,
    children: <Widget>[
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'E.G 1 (현홍)',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box - SM57'),
          onTap: () {
//                            setState(() {});
            print('E.G 1 Button is clicked.');
          }),
//                    Divider(),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'E.G 2',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box - SM57'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('E.G 2 Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Bass',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : -'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Bass Button is clicked.');
          }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Tom 1',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box - Mini'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Tom 1 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Tom 2',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box - Mini'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Tom 2 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Tom 3',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box - Mini'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Tom 3 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Over Head 1',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Over Head 1 Button is clicked.');
//            }),
//        ListTile(
//            leading: Icon(
//              Icons.grid_on,
//              color: Colors.grey[850],
//            ),
//            trailing: Image.asset(
//              'assets/loading.gif',
//              height: 50,
//              width: 50,
//            ),
//            title: Text(
//              'Over Head 2',
//              style: TextStyle(fontSize: 20),
//            ),
//            subtitle: Text('Mic : SHURE Box'),
//            onTap: () {
////                            setState(() {});
////                          Navigator.of(context).pop();
//              print('Over Head 2 Button is clicked.');
//            }),
//                      Container(
//                        child: RaisedButton(
//                          color: Colors.amber,
//                          onPressed: () {},
//                        ),
//                      ),

//                      Container(
//                        color: Colors.green,
//                      ),
//                      Container(
//                        color: Colors.blue,
//                      ),
    ],
//              magnification: 2,
    itemExtent: 50.0,
  );
}

Widget keysList() {
  return ListView(
    padding: EdgeInsets.all(10),
    scrollDirection: Axis.vertical,
    children: <Widget>[
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'S90ES',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box'),
          onTap: () {
//                            setState(() {});
            print('S90ES Button is clicked.');
          }),
//                    Divider(),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Motif XF 7',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : Singer Box - Beta 87A'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Motif XF 7 Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Triton LE',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Triton LE Button is clicked.');
          }),
    ],
    itemExtent: 50.0,
  );
}

Widget drumList() {
  return ListView(
    padding: EdgeInsets.all(10),
    scrollDirection: Axis.vertical,
    children: <Widget>[
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Kick',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box'),
          onTap: () {
//                            setState(() {});
            print('Kick Button is clicked.');
          }),
//                    Divider(),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Snare',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : Singer Box - Beta 87A'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Snare Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Hi-Hat',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Hi-Hat Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Tom 1',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box - Mini'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Tom 1 Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Tom 2',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box - Mini'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Tom 2 Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Tom 3',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box - Mini'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Tom 3 Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Over Head 1',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Over Head 1 Button is clicked.');
          }),
      ListTile(
          leading: Icon(
            Icons.grid_on,
            color: Colors.grey[850],
          ),
          trailing: Image.asset(
            'assets/loading.gif',
            height: 50,
            width: 50,
          ),
          title: Text(
            'Over Head 2',
            style: TextStyle(fontSize: 20),
          ),
          subtitle: Text('Mic : SHURE Box'),
          onTap: () {
//                            setState(() {});
//                          Navigator.of(context).pop();
            print('Over Head 2 Button is clicked.');
          }),
    ],
    itemExtent: 50.0,
  );
}
