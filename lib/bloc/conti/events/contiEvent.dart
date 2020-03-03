import 'package:firebase_auth_login_youtube/bloc/conti/model/contiModel.dart';

enum EventType { add, delete }

class AddContiEvent {
  Songs song;
  int songIndex;
  EventType eventType;

  AddContiEvent.add(Songs song) {
    this.eventType = EventType.add;
    this.song = song;
  }

  AddContiEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.songIndex = index;
  }
}