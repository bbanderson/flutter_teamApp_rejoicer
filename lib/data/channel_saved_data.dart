import 'dart:async';

import 'package:flutter/cupertino.dart';

class ChannelSaved {
  Widget show;

  final _savedController = StreamController<Widget>();

  get savedStream => _savedController.stream;

  changeChannelList(data) {

    //변경된 데이터를 보내준다.
    _savedController.sink.add(show);
  }

  dispose() {
    _savedController.close();
  }
}


//bloc
var channelSaved = ChannelSaved();