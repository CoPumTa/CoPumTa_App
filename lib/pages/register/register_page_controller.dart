import 'package:client/data/models/register_model.dart';
import 'package:client/data/models/social_login_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/cupertino.dart';

class RegisterPageController extends ControllerMVC {
  final RegisterModel _register;
  final SocialLoginModel _socialLoginModel;
  static RegisterPageController? _this;

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  factory RegisterPageController([StateMVC? state]) =>
      _this ??= RegisterPageController._(state);

  RegisterPageController._(StateMVC? state)
      : _register = RegisterModel(),
        _socialLoginModel = SocialLoginModel(),
        super(state);

  get name => _register.name;
  get id => _register.id;
  get password => _register.password;
  get checked => _register.checked;

  void update() => setState(() {});

  void setChecked(bool checked) {
    _register.checked = checked;
    update();
  }

  void onRegisterGoogle() {}
  void onRegisterKakao(BuildContext context) {
    _socialLoginModel.login(context);
    update();
  }

  void onConfirmRegister(String name, String id, String password) {
    _register.name = name;
    debugPrint("debugging name: ${_register.name}");
    _register.id = id;
    debugPrint("debugging id: ${_register.id}");
    _register.password = password;
    debugPrint("debugging password: ${_register.password}");
    update();
  }
}
