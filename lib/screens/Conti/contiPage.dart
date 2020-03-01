import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContiPage extends StatefulWidget {
  @override
  _ContiPageState createState() => _ContiPageState();
}

class _ContiPageState extends State<ContiPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return StreamBuilder(
      stream: Firestore.instance.collection('rejoicer-auth').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          const Text('Loading..');
        } else {
          return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                DocumentSnapshot contiList = snapshot.data.documents[index];
                return Stack(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: size.width,
                          height: size.height,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: Material(
                              color: Colors.white,
                              elevation: 14,
                              shadowColor: Colors.amber,
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width: size.width,
                                        height: 200,
//                                      child: Image.network('${contiList['image']}', fit: BoxFit.fill,),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('${contiList['leaderName']}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('${contiList['contiType']}'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text('${contiList['date']}'),
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
                          top: size.height * 0.47, left: size.height * 0.52),
                      child: Container(
                        width: size.width,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              });
        }
      },
    );
  }
}
