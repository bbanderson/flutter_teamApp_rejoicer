import 'package:flutter/material.dart';
import 'package:firebase_auth_login_youtube/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '';

//var realName = ['변현홍'].map(f);
class Leader {

//  String position;
//  String name;

  Leader({inst: Inst, singer: Singer}){
//    this.position = position;
//    this.name = name;
  }

//  var leader = '이빛나';
//  var subLeader = '이소연';
//  var singLeader = '김채린';
//  var instLeader = '윤예진';

}

Leader instLeader = new Leader(inst: yoonYeJin);

//Leader leeBinna = new Leader('총무', '이빛나');
//Leader leeSoyeon = new Leader('부총무', '이소연');
//Leader kimChaelin = new Leader('싱어팀장', '김채린');
//Leader yoonYeJin = new Leader('악기팀장', '윤예진');

class Singer {
  String name;
  bool sex;
  int age;
  String userID;
//  int date;
//  int birthDay;

  Singer(String name, bool sex, int age, String UserID) {
    this.name = name;
    this.sex = sex;
    this.age = age;
    this.userID = userID;
  }
}

Singer baeJinWoo = new Singer('배진우', true, 24, '');



class Inst {
  String name;
  bool sex;
  int age;
  String part;
  String userID;
//  int date;
//  int birthDay;

  Inst(String name, bool sex, int age, String part, String userID) {
    this.name = name;
    this.sex = sex;
    this.age = age;
    this.part = part;
    this.userID = userID;
  }
}


Inst byunHyunHong = new Inst('변현홍', true, 27, 'E.G', 'tombyun@naver.com');
Inst choiMyeongJin = new Inst('최명진', true, 25, 'E.G', '');
Inst yoonYeJin = new Inst('윤예진', false, 28, 'Key', '');

var emailName = ['tombyun@naver.com'];

//class userId extends StatelessWidget {
//
//  userId({this.email});
//
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}



//String emailToName() {
//
//  return
//}