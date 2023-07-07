import 'dart:developer' as dev;

import 'package:mvc_pattern/mvc_pattern.dart';
import '../models/login_model.dart';

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
    _login.setId(id);
    dev.log("updated to $id");
    update();
  }
  void setPassword(String password) {
    _login.setPassword(password);
    update();
  }
}
