import 'package:firebase_auth_login_youtube/data/users_id.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddConti extends StatefulWidget {

  AddConti({this.name});

  final String name;

  @override
  _AddContiState createState() => _AddContiState();
}

class _AddContiState extends State<AddConti> {
  String leaderName, date, songName, details;

  getLeaderName(leaderName) {
    this.leaderName = leaderName;
  }

  getDate(date) {
    this.date = date;
  }

  getSongName(songName) {
    this.songName = songName;
  }

  getDetails(details) {
    this.details = details;
  }

  int _addContiType = 0;
  String whichConti;

  void _handleAddContiType(int value) {
    setState(() {
      _addContiType = value;
      switch (_addContiType) {
        case 1:
          whichConti = '금요철야';
          break;
        case 2:
          whichConti = '주일5부';
          break;
        case 3:
          whichConti = '수련회';
          break;
        case 4:
          whichConti = '기타';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: <Widget>[
            CupertinoNavigationBar(
              middle: Text(
                '새로운 콘티 추가하기',
                style: TextStyle(fontFamily: 'qn'),
              ),
              backgroundColor: Colors.amber[200],
            ),
            Container(
//            width: _width,
              height: _height - 80,
              child: ListView(
                children: <Widget>[
                  Text('인도자 : ${widget.name}'),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(

                      onChanged: (String name) {
                        getLeaderName(name);
                      },
                      decoration: InputDecoration(labelText: '인도자 : ',),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
