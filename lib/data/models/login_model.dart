import 'dart:convert';
import 'package:client/data/constant.dart';
import 'package:client/data/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginModel {
  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  set email(String id) => (_email = id);
  set password(String password) => (_password = password);

  void login(context) async {
    final request = Uri.parse(BASE_URL + "auth/login/");

    try {
      final response = await http.post(request,
          headers: {"Content-Type": "application/json"},
          body: json.encode({"email": email, "password": password}));
      if (response.statusCode == 401) {
        debugPrint("login 정보 불일치");
      } else {
        var data = jsonDecode(response.body);
        debugPrint(data);
        Provider.of<AuthProvider>(context, listen: false).login();
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  void logout() {}
}
