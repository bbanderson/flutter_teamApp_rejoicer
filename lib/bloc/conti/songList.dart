import 'package:firebase_auth_login_youtube/bloc/conti/addContiBloc.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/events/contiEvent.dart';
import 'package:firebase_auth_login_youtube/bloc/conti/model/contiModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth_login_youtube/screens/Memo/addMemo.dart';


class ContiList extends StatelessWidget {

  String _key;

  @override
  Widget build(BuildContext context) {

    return Container(
        padding: EdgeInsets.all(16),
        child: BlocConsumer<AddContiBloc, List<Songs>>(
          buildWhen: (List<Songs> previous, List<Songs> current) {
            return true;
          },
          listenWhen: (List<Songs> previous, List<Songs> current) {
            if (current.length > previous.length) {
              return true;
            }

            return false;
          },
          builder: (context, songList) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              itemCount: songList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.amber[200],
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () => BlocProvider.of<AddContiBloc>(context).add(
                        AddContiEvent.delete(index),
                      ) ,
                        icon: FaIcon(FontAwesomeIcons.minusCircle, size: 15,)),
                    title: Text('${songList[index].key}. ${songList[index].name}'),
                  ),
                );
              },
            );
          },
          listener: (BuildContext context, songList) {
            Scaffold.of(context).showSnackBar(
              SnackBar(content: Text('추가 완료!')),
            );
          },
        ));
  }
}