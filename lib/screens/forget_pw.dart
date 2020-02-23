import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPwState createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();
  final managerEmail = 'tombyun@naver.com';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Card(
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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('비밀번호를 잊어버리셨다면, 운영자에게 비밀번호 초기화 요청을 할 수 있습니다.\n'
                            +managerEmail+'로 문의해주세요.'),

                      ],
                    ),
                  )
              ),
            ),
          ),
//
//          FlatButton(onPressed: () async {
//            await FirebaseAuth.instance.sendPasswordResetEmail(email: _idController.text);
//            print(_idController.text);
//            final snackBar = SnackBar(
//              content: Text('운영자 이메일로 전송되었습니다.'),
//            );
//            Scaffold.of(_formKey.currentContext).showSnackBar(snackBar);
//          }, child: Text(
//              'Reset Password'),
//          )
        ],
      ),
    );
  }
}
