import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/data/guest_or_rejoicer.dart';
import 'package:firebase_auth_login_youtube/helper/login_background.dart';
import 'package:firebase_auth_login_youtube/helper/login_video.dart';
import 'package:firebase_auth_login_youtube/screens/forget_pw.dart';
import 'package:firebase_auth_login_youtube/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';

class AuthPage extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Rejoicer',
          style: TextStyle(letterSpacing: 3),
          textAlign: TextAlign.center,),
        ),
      body:

      Stack(
          children: <Widget>[
            CircleAvatar(
              child: FadeInImage.assetNetwork(placeholder: 'assets/loading.gif', image: 'assets/login_bg.gif')
    ),

//            SizedBox(height: 10, width: 10,),





            ListView(
//              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ChewieListItem(
                  videoPlayerController: VideoPlayerController.asset(
                      'videos/Prologue_Timelapse.mp4'),
                  looping: true,
                ),

//                _logoImg,
                  Stack(
                  alignment: Alignment.centerLeft,
                  children: <Widget>[
//                    CustomPaint(
//                      size: size,
//                      painter: LoginBackground(isRejoicer: Provider.of<GuestOrRejoicer>(context).isRejoicer),
//                    ),
                    _inputForm(size),
                    _loginButton(size),
//                    Container(width: 100, height: 50, color: Colors.black,),
                  ],
                ),
            Container(height: size.height * 0.1,),

                _bottomBar(size),

                Container(height: size.height * 0.05,),
              ],
            ),
          ]
      ),
    );
  }

  void _register(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _idController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if(user == null) {
      final snackBar = SnackBar(
        content: Text('다시 시도해 주세요.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }

//    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
  }

  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _idController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if(user == null) {
      final snackBar = SnackBar(
        content: Text('다시 시도해 주세요.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }

//    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
  }

  Widget _bottomBar(Size size) {
    return BottomAppBar(
        elevation: 0.0,
        child: Consumer<GuestOrRejoicer>(
          builder: (BuildContext context, guestOrRejoicer, Widget child) => GestureDetector(
              onTap: () {
                guestOrRejoicer.toggle();
              },
              child: Text(guestOrRejoicer.isRejoicer?'계정이 없으시면 Leader에게 문의하세요!\nGuest로 들어가시겠어요?':'Guest 모드입니다.\nRejoicer로 들어가시겠어요?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: guestOrRejoicer.isRejoicer?Colors.red:Colors.blue,),
              )
          ),
        ),
      );
  }
  
  
  Widget _inputForm(Size size) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 12.0,
            right: 12.0,
            top: 12.0,
            bottom: 32.0,
          ),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _idController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: '이름',
                      hintText: '자신의 실명을 입력해주세요!',
                    ),
                    validator: (String value) {
                      if(value.isEmpty) {
                        return "Rejoicer가 아닌 것 같아요!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.vpn_key),
                      labelText: '비밀번호',
                      hintText: '비밀번호를 입력해주세요!',
                    ),
                    validator: (String value) {
                      if(value.isEmpty) {
                        return "비밀번호가 틀린 것 같아요!";
                      }
                      return null;
                    },
                  ),
                  Container(height: 8,),
                  Consumer<GuestOrRejoicer>(
                    builder: (context, value, child) => Opacity(
                      opacity: value.isRejoicer?1:0,
                        child: GestureDetector(onTap: value.isRejoicer?(){goToForgetPw(context);}:null,child: Text('- 비밀번호를 잊으셨나요?'))
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }

  goToForgetPw (BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPw()));
  }

  Widget _loginButton(Size size) {
    return Positioned(
      left: size.width * 0.15,
      right: size.width * 0.15,
      bottom: 0,
      child: SizedBox(
        height: 50,

        child: Consumer<GuestOrRejoicer>(
          builder: (context, guestOrRejoicer, child) => RaisedButton(
            child: Text(guestOrRejoicer.isRejoicer?'Let\'s get it!':'Guest로 로그인', style: TextStyle(fontSize: 20, color: Colors.black),),
            color: guestOrRejoicer.isRejoicer?Colors.orange:Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                guestOrRejoicer.isRejoicer?_login(context):null;
//                print(_idController.text.toString());
              }
            },),
        ),
      ),
    );
  }

  Widget get _logoImg => Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircleAvatar(
            backgroundColor: Colors.amber,
              child: FadeInImage.assetNetwork(placeholder: 'assets/loading.gif', image: 'assets/login_bg.gif')),
        ),
      ),
    );
}
