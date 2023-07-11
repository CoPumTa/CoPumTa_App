import 'dart:convert';

import 'package:client/data/constant.dart';
import 'package:client/data/models/user_info.dart';
import 'package:client/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider with ChangeNotifier {
  // TODO: 로그인 상태 기본 false로 바꾸기
  // 로그인을 유지하려면, sharedPreference 등을 사용하여 local에 저장하여야 할듯?
  String? cookie = null;
  final _prefs = SharedPreferences.getInstance();

  bool get isLoggedIn => (cookie != null);
  // bool get isLoggedIn => true;

  void login(String cookie) async {
    this.cookie = cookie;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("session", cookie);
    debugPrint("login with cookie: ${this.cookie}");

    final request = Uri.parse("${BASE_URL}user/getInfo");

    try {
      final response = await http.get(
        request,
        headers: {"Content-Type": "application/json", "Cookie": cookie},
      );

      final result = json.decode(json.decode(response.body));

      if (response.statusCode == 200 || result != null) {
        UserInfo.user = UserInfo.fromJson(result);
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("userInfo", json.encode(UserInfo.user!));
        debugPrint("서버에서 받아온 todays time: ${UserInfo.user?.todaysTime}");
        prefs.setInt('elapsedTime',
            timeToMilliseconds(UserInfo.user?.todaysTime ?? "00:00:00"));
      } else {
        debugPrint("user/getInfo 실패");
      }
    } catch (error) {
      debugPrint("user/getInfo 에러: $error");
    }

    notifyListeners(); // 상태 변경을 알립니다.
  }

  void logout() async {
    cookie = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("session");
    prefs.remove("userInfo");
    UserInfo.user = null;
    notifyListeners(); // 상태 변경을 알립니다.
  }
}
