import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_login_youtube/data/users_id.dart';
import 'package:firebase_auth_login_youtube/screens/Conti/contiPage.dart';
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
  final ScrollController _scrollController = ScrollController();


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

  createData() {
    DocumentReference ds = Firestore.instance.collection(ContiPage().email.toString()).document(date);
    Map<String, dynamic> addConti = {
      'leaderName' : leaderName,
      'date' : date,
      'songName' : songName,
      'details' : details,
      'contiType' : whichConti,
    };
    ds.setData(addConti).whenComplete(() {
      print('New Conti is Saved.');
    });
//
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
              automaticallyImplyLeading: false,
              middle: Text(
                '새로운 콘티 추가하기',
                style: TextStyle(fontFamily: 'qn'),
              ),
              backgroundColor: Colors.amber[200],
            ),
            Container(
//            width: _width,
              height: _height - 80,
              child: Padding(
                padding: EdgeInsets.all(30),
                child: CupertinoScrollbar(
                  child: ListView(
                    controller: _scrollController,
                    children: <Widget>[
                      Center(
                        child: Text(
                          '예배를 선택해주세요!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.05,
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 1,
                            groupValue: _addContiType,
                            onChanged: _handleAddContiType,
                            activeColor: Colors.amber,
                          ),
                          Text('금요철야'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 2,
                            groupValue: _addContiType,
                            onChanged: _handleAddContiType,
                            activeColor: Colors.amber,
                          ),
                          Text('주일5부'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 3,
                            groupValue: _addContiType,
                            onChanged: _handleAddContiType,
                            activeColor: Colors.amber,
                          ),
                          Text('수련회'),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 4,
                            groupValue: _addContiType,
                            onChanged: _handleAddContiType,
                            activeColor: Colors.amber,
                          ),
                          Text('기타'),
                        ],
                      ),
                      Text('인도자 : ${widget.name}'),
                      TextField(
                        onTap: (){
                          _scrollController.jumpTo(50);
                        },
                        onChanged: (String date) {
                          getDate(date);
                        },
                        decoration: InputDecoration(
                          labelText: '언제인가요?',
                        ),
                      ),
                      TextField(
                        onTap: (){
                          _scrollController.jumpTo(100);
                        },
                        onChanged: (String songName) {
                          getSongName(songName);
                        },
                        decoration: InputDecoration(
                          labelText: '곡 : ',
                        ),
                      ),
                      TextField(
                        onTap: (){
                          _scrollController.jumpTo(200);
                        },
                        onChanged: (String details) {
                          getDetails(details);
                        },
                        decoration: InputDecoration(
                          labelText: '상세설명 : ',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(child: Text('돌아가기'), color: Colors.grey, onPressed: () {Navigator.of(context).pop(context);}),
                      RaisedButton(child: Text('공지하기'), color: Colors.amber, onPressed: () {createData();},),
                      SizedBox(height: 500,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
