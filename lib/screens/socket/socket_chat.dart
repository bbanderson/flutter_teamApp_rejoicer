//import 'package:flutter/material.dart';
//import 'package:web_socket_channel/io.dart';
//
//
//class SocketChat extends StatefulWidget {
//
//  SocketChat() : super();
//
//  final String title = "Socket Chat";
//
//  @override
//  _SocketChatState createState() => _SocketChatState();
//}
//
//// state
//class _SocketChatState extends State<SocketChat> {
//
//
//  TextEditingController _textEditingController;
//  WebSocketChannel _channel;
//
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Container(
//        padding: EdgeInsets.all(20.0),
//        child: Column(
//          children: <Widget>[
//            TextField(
//              controller: _textEditingController,
//              decoration: InputDecoration(
//                border: OutlineInputBorder(
//                  borderRadius: const BorderRadius.all(
//                    const Radius.circular(6.0),
//                  ),
//                ),
//                filled: true,
//                fillColor: Colors.white60,
//                contentPadding: EdgeInsets.all(15.0),
//                hintText: 'Message',
//              ),
//            ),
//            OutlineButton(
//              child: Text('Send Message'),
//              onPressed: () {
//
//              },
//            )
//          ],
//        ),
//      ),
//    );
//  }
//}
