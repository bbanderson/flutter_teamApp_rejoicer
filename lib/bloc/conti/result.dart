import 'package:firebase_auth_login_youtube/bloc/conti/addContiBloc.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/events/contiEvent.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/model/contiModel.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/songList.dart';
import 'package:flutter/material.dart';

class SongListScreen extends StatelessWidget {

//  SongListScreen({@required this.finalList});
//  Map<String, dynamic> finalList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          heroTag: 'button1',
          child: Icon(Icons.save),

      ),
      appBar: AppBar(title: Text('검토하기')),
      body: Column(
        children: <Widget>[
//          Text(finalList.toString()),
          ContiList(),
        ],
      ),

    );
  }
}