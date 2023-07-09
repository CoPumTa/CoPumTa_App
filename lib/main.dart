import 'package:client/pages/login/login_page.dart';
import 'package:client/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'data/providers/auth_provider.dart';

void main() {
  KakaoSdk.init(nativeAppKey: 'dd7c56431141df80cecd3c764bd7e2ee');
  runApp(ChangeNotifierProvider<AuthProvider>(
      create: (_) => AuthProvider(), // 인증 관련 상태를 제공하는 Auth 클래스를 생성합니다.
      child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Poppins'),
        home: Consumer<AuthProvider>(builder: (context, auth, _) {
          if (auth.isLoggedIn) {
            return MainPage();
          } else {
            return LoginPage();
          }
        }));
  }
}
