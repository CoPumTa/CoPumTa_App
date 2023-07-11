import 'dart:convert';
import 'package:client/data/constant.dart';
import 'package:client/data/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginModel {
  String _email = "";
  String _password = "";

  set email(String id) => (_email = id);
  String get email => _email;

  String get password => _password;
  set password(String password) => (_password = password);

  void login(context) async {
    final request = Uri.parse("${BASE_URL}auth/login/");

    try {
      final response = await http.post(request,
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));
      debugPrint("로그인 응답 쿠키 헤더: ${response.headers["set-cookie"]}");
      if (response.statusCode == 401 ||
          response.headers["set-cookie"] == null) {
        debugPrint("login 정보 불일치");
      } else {
        Provider.of<AuthProvider>(context, listen: false)
            .login(
              (response.headers["set-cookie"]?.split(";")[0])!
              // response.headers["set-cookie"]!
            );
      }
    } catch (error) {
      debugPrint("login 에러: $error");
    }
  }

  void logout() {}
}
