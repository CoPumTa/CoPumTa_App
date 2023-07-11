import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  // TODO: 로그인 상태 기본 false로 바꾸기
  // 로그인을 유지하려면, sharedPreference 등을 사용하여 local에 저장하여야 할듯?
  String? cookie = null;
  final _prefs = SharedPreferences.getInstance();

  bool get isLoggedIn => (cookie != null);

  void login(String cookie) {
    this.cookie = cookie;
    _prefs.then((prefs) async {
      prefs.setString("session", cookie);
    });
    debugPrint("login with cookie: ${this.cookie}");
    notifyListeners(); // 상태 변경을 알립니다.
  }

  void logout() {
    cookie = null;
     _prefs.then((prefs) async {
      prefs.remove("session");
    });
    notifyListeners(); // 상태 변경을 알립니다.
  }
}
