import 'package:client/data/providers/timer_provider.dart';
import 'package:client/pages/login/login_page.dart';
import 'package:client/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:provider/provider.dart';
import 'data/providers/auth_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: 'dd7c56431141df80cecd3c764bd7e2ee');
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(create: (_) => AuthProvider()),
          ChangeNotifierProvider<TimerProvider>(create: (_) => TimerProvider())
        ],
        builder: ((context, child) {
          return MaterialApp(
              theme: ThemeData(fontFamily: 'Poppins'),
              home: Provider.of<AuthProvider>(context).isLoggedIn
                  ? MainPage()
                  : LoginPage());
        }));
  }
}
