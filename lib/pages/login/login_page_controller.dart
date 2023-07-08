import 'dart:convert';
import 'dart:developer' as dev;

import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:client/models/login_model.dart';

class LoginController extends ControllerMVC {
  final LoginModel _login;
  static LoginController? _this;

  factory LoginController([StateMVC? state]) =>
      _this ??= LoginController._(state);

  LoginController._(StateMVC? state)
      : _login = LoginModel(),
        super(state);

  get id => _login.id;
  get password => _login.password;

  void update() => setState(() {});

  void setId(String id) {
    _login.id = id;
    update();
  }

  void setPassword(String password) {
    _login.password = password;
    update();
  }
}
