//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/addContiBloc.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/events/contiEvent.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/model/contiModel.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/result.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/songList.dart';
import 'package:firebase_auth_login_youtube/data/users_id.dart';
import 'package:firebase_auth_login_youtube/screens/Memo/MemoPage.dart';
import 'package:firebase_auth_login_youtube/screens/Memo/dateTimePicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class AddMemo extends StatefulWidget {
  AddMemo({this.name});

  String name;

  @override
  _AddMemoState createState() => _AddMemoState();
}

class _AddMemoState extends State<AddMemo> {
  final ScrollController _scrollController = ScrollController();

  String leaderName, date, songName, details, otherWorship;

  int songKeyIndex;

  List<String> keys = [
    'C',
    'Db',
    'D',
    'Eb',
    'E',
    'F',
    'Gb',
    'G',
    'Ab',
    'A',
    'Bb',
    'B'
  ];

  String selectedKey = 'C';

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

  getSelectedKey(selectedKey) {
    this.selectedKey = selectedKey;
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

  Future<String> modifyLeaderName(BuildContext context) {
    TextEditingController textEditingController = new TextEditingController();

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('이름을 입력해주세요!'),
            content: TextField(
              maxLength: 6,
              autofocus: true,
              controller: textEditingController,
            ),
            actions: <Widget>[
              MaterialButton(
                elevation: 5,
                child: Text('수정'),
                onPressed: () {
                  widget.name = textEditingController.text.toString();
                  Navigator.of(context)
                      .pop(textEditingController.text.toString());
                },
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    String _1, _2, _3, _4, _5, _6, _7, _8;

//    String _formattedDate =  DateFormat.yMMMd().format(dateTime);

    //데이터 전송용
//    String leaderName = widget.name +  ' (현재 로그인 계정)';
//    String _date, _songName, _details, _whichConti;

//    Map<String, dynamic> songList = {
//      'leaderName': leaderName,
//      'date': _date,
//      'songName': _songName,
//      'details': _details,
//      'contiType': _whichConti,
//    };

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: <Widget>[
              CupertinoNavigationBar(
                leading: IconButton(
                  icon: FaIcon(FontAwesomeIcons.arrowAltCircleLeft),
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                ),
                automaticallyImplyLeading: false,
                middle: Text(
                  '새로운 콘티 추가하기',
                  style: TextStyle(fontFamily: 'qn'),
                ),
                backgroundColor: Colors.amber[200],
              ),
              Container(
                padding: EdgeInsets.all(5),
//            width: _width,
                height: _height - 80,
                child: CupertinoScrollbar(
                  child: ListView(
                    controller: _scrollController,
                    children: <Widget>[
                      Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Center(
                                  child: Text(
                                    '1. 누가 인도하나요?',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: <Widget>[
                                    Text('인도자 : ${widget.name}'),
                                    IconButton(
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.grey[850],
                                      ),
                                      iconSize: 15,
                                      onPressed: () {
                                        modifyLeaderName(context);
//                                        .then((onValue){
//                                      leaderName = modifyLeaderName(context).toString();
//                                    }
//                                    );
                                      },
                                    )
                                  ],
                                ),
                              ],
                            ),
                          )),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  '2. 언제인가요?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
//                            SizedBox(
//                                width: _width * 0.2, child: Text('언제인가요?')),

                                  SizedBox(
                                    width: _width * 0.5,
                                    child: Text((dateTime == null)
                                        ? '(날짜를 선택해주세요!)'
                                        : dateTime.toString()+dateTime.toString()[0] +
                                        dateTime.toString()[1] +
                                        dateTime.toString()[2] +
                                        dateTime.toString()[3] +'년 '+
                                        dateTime.toString()[5] +
                                        dateTime.toString()[6] +'월 '+
                                        dateTime.toString()[8] +
                                        dateTime.toString()[9] +'일'),
                                  ),
                                  IconButton(
                                      icon: FaIcon(FontAwesomeIcons.calendar),
                                      onPressed: () {
                                        showDatePicker(
                                            context: context,
                                            initialDate: dateTime == null
                                                ? DateTime.now()
                                                : dateTime,
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime(2220))
                                            .then((date) {
                                          setState(() {
                                            dateTime = date;
//                                            String ds = dateTime.toString();
//                                            _1 = ds[0];
//                                            _2 = ds[1];
//                                            _3 = ds[2];
//                                            _4 = ds[3];
//                                            _5 = ds[5];
//                                            _6 = ds[6];
//                                            _7 = ds[8];
//                                            _8 = ds[9];

//                                            _date = dateTime.toString();
                                          });
                                        });
                                      }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      Card(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 15.0, bottom: 15, right: 20),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  '3. 어느 예배인가요?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
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
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
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
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Radio(
                                              value: 5,
                                              groupValue: _addContiType,
                                              onChanged: _handleAddContiType,
                                              activeColor: Colors.amber,
                                            ),
                                            Text('프뉴마데이'),
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
                                      ],
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _height * 0.03,
                      ),

                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  '4. 곡을 선택해주세요!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    '키 : ',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Text(selectedKey),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.grey[850],
                                    ),
                                    iconSize: 15,
                                    onPressed: () async {
                                      await showModalBottomSheet(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return CupertinoPicker(
                                                itemExtent: 60,
                                                backgroundColor: Colors.white,
                                                onSelectedItemChanged: (index) {
                                                  setState(() {
                                                    songKeyIndex = index;
                                                    selectedKey =
                                                    keys[songKeyIndex];
                                                  });
                                                },
                                                looping: true,
                                                children: List<Widget>.generate(
                                                  keys.length,
                                                      (index) {
                                                    return Center(
                                                      child: Text(keys[index]),
                                                    );
                                                  },
                                                ));
                                          });
                                    },
                                  ),
                                ],
                              ),
                              TextField(
                                onTap: () {
                                  _scrollController.jumpTo(_height * 0.6);
                                },
                                onChanged: (String songName) {
                                  getSongName(songName);
//                            BlocProvider.of<AddContiBloc>(context).add(
//                              AddContiEvent.add(
//                                Songs(songName),
//                              ),
//                            );
                                },
                                decoration: InputDecoration(
                                  labelText: '곡 : ',
                                ),
                              ),
                              RaisedButton(
                                  color: Colors.amber[200],
                                  child: FaIcon(FontAwesomeIcons.plusCircle),
                                  onPressed: () {
                                    BlocProvider.of<AddContiBloc>(context).add(
                                      AddContiEvent.add(
                                        Songs(songName, selectedKey),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ),

                      ContiList(),
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
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                  '5. 콘티를 설명해주세요!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                              ),
                              TextField(
                                maxLines: 30,
                                onTap: () {
//                          _scrollController.jumpTo(650);
                                },
                                onChanged: (String details) {
                                  getDetails(details);
                                },
                                decoration: InputDecoration(
                                  labelText: '상세설명',
                                  labelStyle: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
//                      RaisedButton(
//                        child: Text('공지하기'),
//                        color: Colors.amber,
//                        onPressed: () {
////                          createData();
//                          Navigator.of(context).pop(context);
//                        },
//                      ),
//                      SizedBox(
//                        height: 300,
//                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          floatingActionButton:
          Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            SizedBox(height: 16),
            FloatingActionButton(
              heroTag: 'button2',
              child: Icon(Icons.save),
              onPressed: () {
                setState(() {
//                  songList['leaderName'] = leaderName;
//                  songList['date'] = _date;
//                  songList['contiType'] = _whichConti;
//                  songList['songName'] = _songName;
//                  songList['details'] = _details;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SongListScreen(
//                            finalList: songList,
                          )),
                );
              },
            ),
          ]),
        ));
  }
}
