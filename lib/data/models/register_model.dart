import 'dart:convert';
import 'package:client/data/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class RegisterModel {
  bool _checked = false;
  String _name = "";
  String _email = "";
  String _password = "";

  bool get checked => _checked;
  String get name => _name;
  String get email => _email;
  String get password => _password;

  set name(String name) => (_name = name);
  set email(String email) => (_email = email);
  set password(String password) => (_password = password);
  set checked(bool value) => (_checked = value);

  void signUp() async {
    final request = Uri.parse(BASE_URL + "auth/signUp/");

    try {
      final response = await http.post(request,
          headers: {"Content-Type": "application/json"},
          body: json.encode(
              {"userName": name, "email": email, "password": password}));
      if (response.statusCode == 401) {
        debugPrint("회원가입 에러");
      } else {
        // 정상적인 회원 등록
        var data = jsonDecode(response.body);
        debugPrint(data);
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void signUpWithSnsId(
      String? userName, String? email, String snsId, String? provider) async {
    final request = Uri.parse(BASE_URL + "auth/signUp/");

    try {
      final response = await http.post(request,
          headers: {"Content-Type": "application/json"},
          body: json.encode({
            "userName": userName,
            "email": email,
            "snsId": snsId,
            "provider": provider
          }));
      if (response.statusCode == 401) {
        debugPrint("response.statusCode: " + response.statusCode.toString());
        debugPrint("회원가입 에러");
      } else {
        // 정상적인 회원 등록

      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
