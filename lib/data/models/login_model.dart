import 'dart:convert';
import 'package:client/data/constant.dart';
import 'package:client/data/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginModel {
  String _email = "";
  String _password = "";

  static String cookie = "";

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
      if (response.statusCode == 401 || response.headers["set-cookie"] == null) {
        debugPrint("login 정보 불일치");
      } else {
        LoginModel.cookie = response.headers["set-cookie"]!;
        Provider.of<AuthProvider>(context, listen: false).login();
      }
    } catch (error) {
      debugPrint("login 에러: $error");
    }
  }

  void logout() {}
}
