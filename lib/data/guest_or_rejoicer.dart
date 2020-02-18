import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class GuestOrRejoicer extends ChangeNotifier {
  bool _isRejoicer = true;

  bool get isRejoicer => _isRejoicer;

  void toggle() {
    _isRejoicer = !_isRejoicer;
    notifyListeners();
  }
}