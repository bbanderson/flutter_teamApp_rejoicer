import 'package:firebase_auth_login_youtube/bloc/conti/model/contiModel.dart';

enum EventType { add, delete }

class FoodEvent {
  Songs song;
  int songIndex;
  EventType eventType;

  FoodEvent.add(Songs song) {
    this.eventType = EventType.add;
    this.song = song;
  }

  FoodEvent.delete(int index) {
    this.eventType = EventType.delete;
    this.songIndex = index;
  }
}