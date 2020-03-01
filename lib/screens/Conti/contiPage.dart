import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth_login_youtube/data/users_id.dart';
import 'package:firebase_auth_login_youtube/screens/Conti/addConti.dart';
import 'package:firebase_auth_login_youtube/screens/Conti/savedContiPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/fa_icon.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContiPage extends StatefulWidget {

  ContiPage({this.email});

  final String email;

  @override
  _ContiPageState createState() => _ContiPageState();
}

class _ContiPageState extends State<ContiPage> {

  Set<String> savedConti = Set<String>();

  Widget HeartButton(String conti) {

    final bool isSaved = savedConti.contains(conti);

    return ListTile(
      title: Text(conti),

    );


  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String userName = emailToName[widget.email];



    return StreamBuilder(
      stream: Firestore.instance.collection('rejoicer-auth').snapshots(),
      // ignore: missing_return
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container(
//            key: ValueKey(0),
            color: Colors.amber[50],
            child: ListTile(
              leading: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
              ),
              title: Text('잠시만 기다려주세요'),
              subtitle: Text('loading...'),
            ),
          );
        } else {
          return Scaffold(
            appBar: CupertinoNavigationBar(
              middle: Text('그때 그 콘티', style: TextStyle(fontFamily: 'qn'),),
              trailing: IconButton(
                onPressed: (){},
                padding: EdgeInsets.only(left: 10),
                icon: FaIcon(
                  FontAwesomeIcons.search,
                  color: Colors.grey[850],
                ),
                iconSize: 20,
              ),
            ),
            body: ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot contiList = snapshot.data.documents[index];
                  return Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            width: size.width * 0.998,
                            height: 500,
                            child: Padding(
                              padding: EdgeInsets.only(top: 8, bottom: 8),
                              child: Material(
                                color: Colors.amber[200],
                                elevation: 15,
                                shadowColor: Colors.amber,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Container(
                                          width: size.width * 0.9,
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            child: Container(
                                              height: 100,
                                              child: Center(
                                                  child: Text(
                                                '${contiList['date']} ${contiList['contiType']}예배',
                                                style: TextStyle(fontSize: 25),
                                              )),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        (contiList['leaderName'] != null)
                                            ? Text(
                                                '인도자 : ${contiList['leaderName']}')
                                            : SizedBox(),
//                                        Container(
//                                          width: size.width,
//                                          height: 200,
////                                      child: Image.network('${contiList['image']}', fit: BoxFit.fill,),
//                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('${contiList['songName']}'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text('${contiList['details']}'),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(
                            top: size.height * 0.07, right: size.height * 0.42),
                        child: Container(
                          width: size.width,
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 20,
                                color: Colors.pink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }),
            floatingActionButton: FloatingActionButton(
              child: FaIcon(FontAwesomeIcons.solidHeart, color: Colors.pink,),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => SavedConti()));
              },
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          );
        }
      },
    );
  }

  Widget progress = Container(
    key: ValueKey(0),
    color: Colors.amber[50],
    child: ListTile(
      leading: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent),
      ),
      title: Text('잠시만 기다려주세요'),
      subtitle: Text('loading...'),
    ),
  );
}
