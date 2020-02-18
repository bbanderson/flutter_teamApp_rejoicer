import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {
  
  LoginBackground({@required this.isRejoicer});
  
  final bool isRejoicer;
  
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint paint = Paint()..color = isRejoicer?Colors.amber:Colors.blueAccent;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 1.2), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }

}