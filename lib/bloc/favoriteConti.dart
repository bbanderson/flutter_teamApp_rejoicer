import 'package:flutter/material.dart';

class FavoriteConti extends StatelessWidget {

  FavoriteConti({@required this.saved});

  Set saved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('저장한 목록'),
      ),
      body: Text(
        saved.toString()
      ),
    );
  }
}
