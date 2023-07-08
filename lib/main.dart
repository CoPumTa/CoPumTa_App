import 'package:client/pages/login/login_page.dart';
import 'package:client/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/providers/auth_provider.dart';

void main() {
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
