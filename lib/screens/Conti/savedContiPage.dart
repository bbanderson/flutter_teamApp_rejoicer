import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavedConti extends StatelessWidget {
  SavedConti({@required this.saved});

  final Set<SavedConti> saved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text('My Saved List')));
  }
}
