import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  // TODO: 로그인 상태 기본 false로 바꾸기
  // 로그인을 유지하려면, sharedPreference 등을 사용하여 local에 저장하여야 할듯?
  bool _isLoggedIn = true; // 로그인 상태를 나타내는 변수

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners(); // 상태 변경을 알립니다.
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners(); // 상태 변경을 알립니다.
  }
}
