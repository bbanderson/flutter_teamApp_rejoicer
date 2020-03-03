import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_login_youtube/data/users_id.dart';
import 'package:firebase_auth_login_youtube/screens/Memo/MemoPage.dart';
import 'package:firebase_auth_login_youtube/screens/Memo/dateTimePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddMemo extends StatefulWidget {
  AddMemo({this.name});

  final String name;

  @override
  _AddMemoState createState() => _AddMemoState();
}

class _AddMemoState extends State<AddMemo> {
  final ScrollController _scrollController = ScrollController();

  String leaderName, date, songName, details, otherWorship;
  List songList;

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

  getOtherWorship(otherWorship) {
    this.otherWorship = otherWorship;
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
          whichConti = '새벽기도';
          break;
        case 4:
          whichConti = '수련회';
          break;
        case 5:
          whichConti = '프뉴마데이';
          break;
        case 6:
          whichConti = '기타';
          break;
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
    DocumentReference ds = Firestore.instance
        .collection(MemoPage().email.toString())
        .document(date);
    Map<String, dynamic> addConti = {
      'leaderName': leaderName,
      'date': date,
      'songName': songName,
      'details': details,
      'contiType': whichConti,
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
                        height: _height * 0.03,
                      ),
                      Row(children:<Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
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
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Radio(
                                value: 3,
                                groupValue: _addContiType,
                                onChanged: _handleAddContiType,
                                activeColor: Colors.amber,
                              ),
                              Text('새벽기도'),
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
                              Text('수련회'),
                            ],
                          ),

                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 5,
                              groupValue: _addContiType,
                              onChanged: _handleAddContiType,
                              activeColor: Colors.amber,
                            ),
                            Text('프뉴마\n데이'),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Radio(
                              value: 6,
                              groupValue: _addContiType,
                              onChanged: _handleAddContiType,
                              activeColor: Colors.amber,
                            ),
                            Text('기타'),
                          ],
                        ),
                      ],),
])
                      ,Text('인도자 : ${widget.name}'),

                      Row(children: <Widget>[
                        SizedBox(width: _width * 0.2, child: Text('언제인가요?')),
                        SizedBox(width: _width * 0.5,
                          child: Text((dateTime == null)
                              ? '날짜를 선택해주세요!'
                              : dateTime.toString()),
                        ),
                        IconButton(icon: FaIcon(FontAwesomeIcons.calendar),
                            onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: dateTime==null?DateTime.now():dateTime,
                              firstDate: DateTime(2020),
                              lastDate: DateTime(2220))
                              .then((date) {
                            setState(() {
                              dateTime = date;
                            });
                          });
                        }),
                      ],),


                      TextField(
                        onTap: () {
                          _scrollController.jumpTo(100);
                        },
                        onChanged: (String songName) {
                          getSongName(songName);
                          BlocProvider.of<FoodBloc>(context).add(
                            FoodEvent.add(
                              Food(_foodname),
                            ),
                          ),
                        },
                        decoration: InputDecoration(
                          labelText: '곡 : ',
                        ),
                      ),
//                      TextField(
//                        onTap: () {
//                          _scrollController.jumpTo(200);
//                        },
//                        onChanged: (String songName) {
//                          getSongName(songName);
//                        },
//                        decoration: InputDecoration(
//                          labelText: '곡 : ',
//                        ),
//                      ),
//                      TextField(
//                        onTap: () {
//                          _scrollController.jumpTo(300);
//                        },
//                        onChanged: (String songName) {
//                          getSongName(songName);
//                        },
//                        decoration: InputDecoration(
//                          labelText: '곡 : ',
//                        ),
//                      ),
//                      TextField(
//                        onTap: () {
//                          _scrollController.jumpTo(400);
//                        },
//                        onChanged: (String songName) {
//                          getSongName(songName);
//                        },
//                        decoration: InputDecoration(
//                          labelText: '곡 : ',
//                        ),
//                      ),
//                      TextField(
//                        onTap: () {
//                          _scrollController.jumpTo(500);
//                        },
//                        onChanged: (String songName) {
//                          getSongName(songName);
//                        },
//                        decoration: InputDecoration(
//                          labelText: '곡 : ',
//                        ),
//                      ),
//                      TextField(
//                        onTap: () {
//                          _scrollController.jumpTo(600);
//                        },
//                        onChanged: (String songName) {
//                          getSongName(songName);
//                        },
//                        decoration: InputDecoration(
//                          labelText: '곡 : ',
//                        ),
//                      ),
                      TextField(
                        maxLines: 30,
                        onTap: () {
                          _scrollController.jumpTo(650);
                        },
                        onChanged: (String details) {
                          getDetails(details);
                        },
                        decoration: InputDecoration(
                          labelText: '상세설명',
                          labelStyle: TextStyle(),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      RaisedButton(
                        child: Text('공지하기'),
                        color: Colors.amber,
                        onPressed: () {
                          createData();
                          Navigator.of(context).pop(context);
                        },
                      ),
                      RaisedButton(
                          child: Text('돌아가기'),
                          color: Colors.grey,
                          onPressed: () {
                            Navigator.of(context).pop(context);
                          }),
//                      SizedBox(
//                        height: 300,
//                      ),
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
