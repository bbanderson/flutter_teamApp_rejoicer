import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPw extends StatefulWidget {
  @override
  _ForgetPwState createState() => _ForgetPwState();
}

class _ForgetPwState extends State<ForgetPw> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
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
            FlatButton(onPressed: () async {
              await FirebaseAuth.instance.sendPasswordResetEmail(email: _idController.text);
              final snackBar = SnackBar(
                content: Text('이메일로 전송되었습니다.'),
              );
              Scaffold.of(_formKey.currentContext).showSnackBar(snackBar);
            }, child: Text(
                'Reset Password'),
            )
          ],
        ),
      ),
    );
  }
}
