import 'dart:async';
//import 'dart:js';

//import 'dart:html';
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_login_youtube/data/guest_or_rejoicer.dart';
import 'package:firebase_auth_login_youtube/helper/login_background.dart';
import 'package:firebase_auth_login_youtube/helper/login_video.dart';
import 'package:firebase_auth_login_youtube/screens/forget_pw.dart';
import 'package:firebase_auth_login_youtube/screens/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
//import 'package:flutter_kakao_login/flutter_kakao_login.dart';

//import 'package:kakao_flutter_sdk/all.dart';
import 'package:video_player/video_player.dart';
import 'package:provider/provider.dart';
//import 'package:kakao_flutter_sdk/kakao_flutter_sdk_plugin.dart';

//KakaoContext.clientId = "${put your native app key here}";

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<ScaffoldState> _showSnackBar = GlobalKey<ScaffoldState>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _guestForm = GlobalKey<FormState>();

  final TextEditingController _idController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  final double _tvHeight = 0.3;

  String _error;

  _authSnackBar() {
    final snackBar = SnackBar(
      content: Text('다시 시도해 주세요.'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    );
    _showSnackBar.currentState.showSnackBar(snackBar);
  }

  double makeTvHeight(size) {
    return size * _tvHeight;
  }

  VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    videoPlayerController = VideoPlayerController.asset('videos/loginPage.mov')
      ..initialize().then((_) {
        setState(() {});
      });
    videoPlayerController.setLooping(true);
    videoPlayerController.play();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Stack(children: <Widget>[
      VideoPlayer(videoPlayerController),
      GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          key: _showSnackBar,
          backgroundColor: Colors.transparent,
//      appBar: AppBar(
//        elevation: 0,
//        centerTitle: true,
//        title: Text(
//          '\nRejoicer\n',
//          maxLines: 2,
//          textScaleFactor: 1,
//          style: TextStyle(letterSpacing: 5),
//          textAlign: TextAlign.center,
//        ),
//      ),
          body: myOriginalLoginStack(size),
        ),
      ),
    ]);
  }

  Stack myOriginalLoginStack(Size size) {
//    final _auth = Provider.of(context).auth;

    return Stack(children: <Widget>[
//          CircleAvatar(
//            child: FadeInImage.assetNetwork(placeholder: 'assets/loading.gif', image: 'assets/login_bg.gif')
//  ),
//      SizedBox(
//        height: 10,
//        width: 10,
//      ),

      Positioned(
        top: size.height * 0.3,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
//            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
//              Container(
//                height: makeTvHeight(size.height),
//                child: Padding(
//                  padding: EdgeInsets.all(size.width * 0.01),
//                  child: Card(
//                    color: Colors.black87,
//                    shape: RoundedRectangleBorder(
//                      borderRadius: BorderRadius.circular(20),
//                    ),
//                    child: Padding(
//                      padding: EdgeInsets.only(
//                          left: 20, right: 20, top: 10, bottom: 10),
////                      child: ChewieListItem(
////                        videoPlayerController: VideoPlayerController.asset(
////                            'videos/Prologue_Timelapse.mp4'),
////                        looping: true,
////                      ),
//                    ),
//                  ),
//                ),
//              ),

//                _logoImg,

//              Container(
//                height: size.height * 0.1,
//              ),
              Container(
                height: size.height,
                width: size.width,
                child: ListView(
                  controller: _scrollController,
                  children: <Widget>[
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
//                    CustomPaint(
//                      size: size,
//                      painter: LoginBackground(isRejoicer: Provider.of<GuestOrRejoicer>(context).isRejoicer),
//                    ),

                        Consumer<GuestOrRejoicer>(
                          builder: (context, value, child) => value.isRejoicer
                              ? Opacity(
                                  opacity: value.isRejoicer ? 1 : 0,
                                  child: _inputForm(size))
                              : Padding(
                                  padding: EdgeInsets.all(size.width * 0.05),
                                  child: Opacity(
                                    opacity: 0,
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
                                            key: _guestForm,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                    'Guest 모드에서는 게시글 작성 등의 기능과 열람할 수 있는 정보가 제한됩니다.',
                                                    textAlign:
                                                        TextAlign.center),
                                                Container(
                                                  height: 8,
                                                ),
                                                Consumer<GuestOrRejoicer>(
                                                  builder: (context, value,
                                                          child) =>
                                                      Opacity(
                                                          opacity:
                                                              value.isRejoicer
                                                                  ? 1
                                                                  : 0,
                                                          child:
                                                              GestureDetector(
                                                                  onTap: value
                                                                          .isRejoicer
                                                                      ? () {
                                                                          goToForgetPw(
                                                                              context);
                                                                        }
                                                                      : null,
                                                                  child: Text(
                                                                      '- 비밀번호를 잊으셨나요?'))),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        _loginButton(size),

//                    Container(width: 100, height: 50, color: Colors.black,),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Consumer<GuestOrRejoicer>(
                      builder: (context, guestOrRejoicer, child) =>
                          guestOrRejoicer.isRejoicer
                              ? Container(
                                  width: size.width * 0.5,
                                  child: AppleSignInButton(
                                    onPressed: () async {
//                  await _auth.signInWithApple();
//                  Navigator.push(context,
//                      MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
//                  Navigator.of(context).pushReplacementNamed('/home');
                                    },
                                    style: ButtonStyle.black,
                                  ),
                                )
                              : SizedBox(),
                    ),
                    ShowAlert(),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),

//            FlutterKakaoLogin(),
//          Container(height: size.height * 0.1,),

//              Container(height: size.height * 0.05,),
            ]),
      ),
      Positioned(
        right: -30,
        child: Container(
          margin: EdgeInsets.all(0.0),
          child: _bottomBar(size),
        ),
      ),
    ]);
  }

//  void _register(BuildContext context) async {
//    final AuthResult result = await FirebaseAuth.instance
//        .createUserWithEmailAndPassword(
//            email: _idController.text, password: _passwordController.text);
//    final FirebaseUser user = result.user;
//
//    if (user == null) {
//      _authSnackBar();
//    }
//
////    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(email: user.email)));
//  }

  void _login(BuildContext context) async {
    try {
      final AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _idController.text, password: _passwordController.text);
      final FirebaseUser user = result.user;
    } catch (e) {
      print(e);
      String ema;
      if (e.message == 'The password is invalid or the user does not have a password.') {
        ema = '비밀번호가 틀립니다!';
      }
      else if (e.message == 'The email address is badly formatted.') {
        ema = '이메일 주소가 틀립니다!';
      }
      else if (e.message == 'There is no user record corresponding to this identifier. The user may have been deleted.') {
        ema = 'Rejoicer가 아닌 것 같아요!';
      }
      setState(() {
        _error = ema;
      });
    }

//    if (user == null) {
//      _authSnackBar();
////      final snackBar = SnackBar(
////        content: Text('다시 시도해 주세요.'),
////      );
////      Scaffold.of(context).showSnackBar(snackBar);
//    }

//    Navigator.push(context,
//        MaterialPageRoute(builder: (context) => MainPage(email: user.email)));
  }

  Widget ShowAlert() {
    if (_error != null) {
      return Container(
        color: Colors.amberAccent,
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.error_outline),
            ),
            Expanded(
              child: AutoSizeText(
                _error,
                maxLines: 3,
              ),
            ),
            IconButton(icon: Icon(Icons.close), onPressed: () {
              setState(() {
                _error = null;
              });
            }),

          ],
        ),
      );
    }
    return SizedBox(
      height: 0,
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
                    onTap: () {
                      _scrollController.jumpTo(10.0);
                    },
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    controller: _idController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_circle),
                      labelText: '이메일',
                      hintText: '이메일을 입력해주세요!',
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "이메일을 입력해주세요!";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    onTap: () {
                      _scrollController.jumpTo(10.0);
                    },
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
                        return "비밀번호를 입력해주세요!";
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
      width: size.width * 0.5,
      margin: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
//          _kakaoLogin(),
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            disabledColor: Colors.grey[850],
//        elevation: 0.0,
            child: Consumer<GuestOrRejoicer>(
              builder: (BuildContext context, guestOrRejoicer, Widget child) =>
                  GestureDetector(
                      onTap: () {
                        guestOrRejoicer.toggle();
                      },
                      child: Row(
                        children: <Widget>[
                          Text(
                            guestOrRejoicer.isRejoicer ? '배경영상 보기' : '로그인하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: guestOrRejoicer.isRejoicer
                                  ? Colors.white
                                  : Colors.white,
                            ),
                          ),
                          Icon(
                            CupertinoIcons.refresh_thick,
                            color: Colors.white,
                            size: 11,
                          ),
                        ],
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
          width: size.width * 0.5,
          height: 50,
          child: Consumer<GuestOrRejoicer>(
            builder: (context, guestOrRejoicer, child) =>
                guestOrRejoicer.isRejoicer
                    ? RaisedButton(
                        child: Text(
                          'Rejoice 계정으로 로그인',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                        color: Colors.grey[850],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25)),
                        onPressed: () {
//                        guestOrRejoicer.isRejoicer ? _authSnackBar() : null;
                          if (_formKey.currentState.validate()) {
                            guestOrRejoicer.isRejoicer
                                ? _login(context)
                                : _authSnackBar();
                            print(_idController.text.toString());
                          }
//                        _authSnackBar();
                        },
                      )
                    : SizedBox(),
          )

//        RaisedButton(
//          child: Text(
//            'Rejoice 계정으로 로그인',
//            style: TextStyle(fontSize: 15, color: Colors.white),
//          ),
//          color: Colors.grey[850],
//          shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(25)),
//          onPressed: () {
////                        guestOrRejoicer.isRejoicer ? _authSnackBar() : null;
//            if (_formKey.currentState.validate()) {
//              _login(context);
//              print(_idController.text.toString());
//            }
//          },
//        )

//        ,
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
