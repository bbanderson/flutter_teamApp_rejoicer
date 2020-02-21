import 'dart:async';

//import 'dart:html';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/data/guest_or_rejoicer.dart';
import 'package:firebase_auth_login_youtube/helper/login_background.dart';
import 'package:firebase_auth_login_youtube/helper/login_video.dart';
import 'package:firebase_auth_login_youtube/screens/forget_pw.dart';
import 'package:firebase_auth_login_youtube/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_plugin.dart';


//KakaoContext.clientId = "${put your native app key here}";


class AuthPage extends StatelessWidget {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final double _tvHeight = 0.3;

  double makeTvHeight(size) {
    return size * _tvHeight;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          '\nRejoicer\n',
          maxLines: 2,
//          textScaleFactor: 1,
          style: TextStyle(letterSpacing: 5),
          textAlign: TextAlign.center,
        ),
      ),
      body: myOriginalLoginStack(size),
    );
  }

  Stack myOriginalLoginStack(Size size) {
    return Stack(children: <Widget>[
//          CircleAvatar(
//            child: FadeInImage.assetNetwork(placeholder: 'assets/loading.gif', image: 'assets/login_bg.gif')
//  ),

      SizedBox(
        height: 10,
        width: 10,
      ),

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
//            height: makeTvHeight(size.height),
          child: ListView(
//              mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                height: makeTvHeight(size.height),
                child: Padding(
                  padding: EdgeInsets.all(size.width * 0.01),
                  child: Card(
                  color: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: ChewieListItem(
                        videoPlayerController: VideoPlayerController.asset(
                            'videos/Prologue_Timelapse.mp4'),
                        looping: true,
                      ),
                    ),
                  ),
                ),
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
//          Container(height: size.height * 0.1,),

              _bottomBar(size),

//              Container(height: size.height * 0.05,),
            ],
          ),
        ),
      )
    ]);
  }

  void _register(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: _idController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snackBar = SnackBar(
        content: Text('다시 시도해 주세요.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }

//    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
  }

  void _login(BuildContext context) async {
    final AuthResult result = await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _idController.text, password: _passwordController.text);
    final FirebaseUser user = result.user;

    if (user == null) {
      final snackBar = SnackBar(
        content: Text('다시 시도해 주세요.'),
      );
      Scaffold.of(context).showSnackBar(snackBar);
    }

//    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
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
                    keyboardType: TextInputType.emailAddress,
                    controller: _idController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: '이름',
                      hintText: '자신의 실명을 입력해주세요!',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Rejoicer가 아닌 것 같아요!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      controller: _passwordController,
                      decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key),
                        labelText: '비밀번호',
                        hintText: '비밀번호를 입력해주세요!',
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "비밀번호가 틀린 것 같아요!";
                        }
                        return null;
                      },
                    ),
                  Container(
                    height: 8,
                  ),
                  Consumer<GuestOrRejoicer>(
                    builder: (context, value, child) => Opacity(
                        opacity: value.isRejoicer ? 1 : 0,
                        child: GestureDetector(
                            onTap: value.isRejoicer
                                ? () {
                                    goToForgetPw(context);
                                  }
                                : null,
                            child: Text('- 비밀번호를 잊으셨나요?'))),
                  ),
                ],
              )),
        ),
      ),
    );
  }


  Widget _bottomBar(Size size) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
//          _kakaoLogin(),
          RaisedButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            disabledColor: Colors.grey[850],
//        elevation: 0.0,
            child: Consumer<GuestOrRejoicer>(
              builder: (BuildContext context, guestOrRejoicer, Widget child) =>
                  GestureDetector(
                      onTap: () {
                        guestOrRejoicer.toggle();
                      },
                      child: Text(
                        guestOrRejoicer.isRejoicer
                            ? '계정이 없으시면 Leader에게 문의하세요!\nGuest로 들어가시겠어요?'
                            : 'Guest 모드입니다.\nRejoicer로 들어가시겠어요?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: guestOrRejoicer.isRejoicer
                              ? Colors.white
                              : Colors.blue,
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }

  goToForgetPw(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ForgetPw()));
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
            child: Text(
              guestOrRejoicer.isRejoicer ? 'Let\'s get it!' : 'Guest로 로그인',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            color: guestOrRejoicer.isRejoicer ? Colors.orange : Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                guestOrRejoicer.isRejoicer ? _login(context) : null;
//                print(_idController.text.toString());
              }
            },
          ),
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
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/loading.gif',
                    image: 'assets/login_bg.gif')),
          ),
        ),
      );


//  Widget _kakaoLogin() {
//    return RaisedButton(
//      child: Text('Login with kakao'),
//      onPressed: () {
//        _loginWithKakao();
//      },
//    );
//  }
}

//  void _loginWithKakao() async {
//    try {
//      String authCode = await AuthCodeClient.instance.request(); // via browser
//      // String authCode = await AuthCodeClient.instance.requestWithTalk() // or with KakaoTalk
//      AccessToken token = (await AuthApi.instance.issueAccessToken(authCode)) as AccessToken;
//      AccessTokenStore.instance.toCache(token); // Store access token in AccessTokenStore for future API requests.
//    } catch (e) {
//      // some error happened during the course of user login... deal with it.
//    }
//
//    String token = await AccessTokenStore.instance.fromCache();
//    if (token.refreshToken == null) {
//      Navigator.of(context).pushReplacementNamed('/login');
//    } else {
//      Navigator.of(context).pushReplacementNamed("/main");
//    }
//  }
