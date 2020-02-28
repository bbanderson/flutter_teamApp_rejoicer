import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/data/guest_or_rejoicer.dart';
import 'package:firebase_auth_login_youtube/screens/login.dart';
import 'package:firebase_auth_login_youtube/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

//import 'package:kakao_flutter_sdk/all.dart';
import 'screens/socket/socket_chat.dart';

void main()  {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    KakaoContext.clientId = '9e7ef641a8dfd745d8098edab4a738e5';
    return MaterialApp(
      title: 'Rejoicer',
      theme: ThemeData(primarySwatch: Colors.amber, fontFamily: 'qn'),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FirebaseUser>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return ChangeNotifierProvider<GuestOrRejoicer>.value(
                value: GuestOrRejoicer(), child: AuthPage());
          } else {
//          String realName = snapshot.data.email.toString();
            return MainPage(email: snapshot.data.email);
          }
        });
  }
}
