import 'dart:convert';

import 'package:client/data/constant.dart';
import 'package:client/data/models/login_model.dart';
import 'package:client/data/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import 'login_model.dart';

class SocialLoginModel {
  User? user;

  Future<User?> socialLogin() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      User user = await UserApi.instance.me();

      List<String> scopes = [];
      if (user.kakaoAccount?.emailNeedsAgreement == true) {
        debugPrint("이메일 제공 동의 필요");
        scopes.add('account_email');
      }

      if (user.kakaoAccount?.profileNeedsAgreement == true) {
        scopes.add("profile");
      }

      if (scopes.length > 0) {
        try {
          OAuthToken token = await UserApi.instance.loginWithNewScopes(scopes);
          debugPrint('현재 사용자가 동의한 동의 항목: ${token.scopes}');
        } catch (error) {
          debugPrint("추가 동의 요청 실패 $error");
          return null;
        }

        try {
          user = await UserApi.instance.me();
        } catch (error) {
          print('카카오 로그인 실패 $error');
          return null;
        }
      }

      print('사용자 정보 요청 성공'
          '\n회원번호: ${user.id}'
          '\n닉네임: ${user.kakaoAccount?.profile?.nickname}'
          '\n이메일: ${user.kakaoAccount?.email}');
      return user;
    } catch (error) {
      print('카카오 로그인 실패 $error');
      return null;
    }
  }

  void login(context, String? email, String snsId, String provider) async {
    final request = Uri.parse("${BASE_URL}auth/login/");

    try {
      final response = await http.post(request,
          headers: {"Content-Type": "application/json"},
          body: json
              .encode({"email": email, "snsId": snsId, "provider": provider}));
      if (response.statusCode == 401 ||
          response.headers["set-cookie"] == null) {
        debugPrint("login 정보 불일치");
      } else {
        LoginModel.cookie = response.headers["set-cookie"]!;
        Provider.of<AuthProvider>(context, listen: false).login();
      }
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}
