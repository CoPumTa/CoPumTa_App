import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  // TODO: 로그인 상태 기본 false로 바꾸기
  // 로그인을 유지하려면, sharedPreference 등을 사용하여 local에 저장하여야 할듯?
  String? cookie = null;

  bool get isLoggedIn => (cookie != null);

  void login(String cookie) {
    this.cookie = cookie;
    debugPrint("login with cookie: ${this.cookie}");
    notifyListeners(); // 상태 변경을 알립니다.
  }

  void logout() {
    cookie = null;
    notifyListeners(); // 상태 변경을 알립니다.
  }
}
