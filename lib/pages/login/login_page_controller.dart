import 'package:client/data/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:client/data/models/login_model.dart';

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

  get email => _login.email;
  get password => _login.password;

  void update() => setState(() {});

  Future<void> onLoginGoogle() async {}
  Future<void> onLoginKakao() async {
    // TODO: SocialLoginModel을 singleton으로 선언하고 해당 instance의 login을 호출할 것
  }

  void onConfirmLogin(String email, String password, BuildContext context) {
    _login.email = email;
    debugPrint("debugging email: ${_login.email}");
    _login.password = password;
    debugPrint("debugging password: ${_login.password}");

    _login.login(context);
    update();
  }
}
