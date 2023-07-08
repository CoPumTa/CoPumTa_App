import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:client/models/login_model.dart';

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

  void onConfirmLogin(String id, String password) {
    _login.id = id;
    debugPrint("debugging id: ${_login.id}");
    _login.password = password;
    debugPrint("debugging password: ${_login.password}");
    update();
  }
}
