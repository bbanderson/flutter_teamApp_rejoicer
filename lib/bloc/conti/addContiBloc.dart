import 'package:firebase_auth_login_youtube/bloc/conti/events/contiEvent.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/model/contiModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContiBloc extends Bloc<AddContiEvent, List<Songs>> {
  @override
  List<Songs> get initialState => List<Songs>();

  @override
  Stream<List<Songs>> mapEventToState(AddContiEvent event) async* {
    switch (event.eventType) {
      case EventType.add:
        List<Songs> newState = List.from(state);
        if (event.song != null) {
          newState.add(event.song);
        }
        yield newState;
        break;
      case EventType.delete:
        List<Songs> newState = List.from(state);
        print(newState.length);
        newState.removeAt(event.songIndex);
        yield newState;
        break;
      default:
        throw Exception('Event not found $event');
    }
  }
}