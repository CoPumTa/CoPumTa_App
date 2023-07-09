import 'package:client/data/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:client/data/models/login_model.dart';
import 'package:provider/provider.dart';

class LoginPageController extends ControllerMVC {
  final LoginModel _login;
  static LoginPageController? _this;

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  factory LoginPageController([StateMVC? state]) =>
      _this ??= LoginPageController._(state);

  LoginPageController._(StateMVC? state)
      : _login = LoginModel(),
        super(state);

  get id => _login.id;
  get password => _login.password;

  void update() => setState(() {});

  Future<void> onLoginGoogle() async {}
  Future<void> onLoginKakao() async {
    // TODO: SocialLoginModel을 singleton으로 선언하고 해당 instance의 login을 호출할 것
  }

  void onConfirmLogin(String id, String password, BuildContext context) {
    _login.id = id;
    debugPrint("debugging id: ${_login.id}");
    _login.password = password;
    debugPrint("debugging password: ${_login.password}");

    // TODO: 로그인 정보가 유효한지 확인
    Provider.of<AuthProvider>(context, listen: false).login();
  }
}
