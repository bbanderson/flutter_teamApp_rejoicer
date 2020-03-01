import 'package:flutter/material.dart';
    
class AddConti extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(onPressed: null,
        child: Text('ADD'),),
      ),
    );
  }
}
