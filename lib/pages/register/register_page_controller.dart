import 'package:client/data/models/register_model.dart';
import 'package:client/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/cupertino.dart';

class RegisterPageController extends ControllerMVC {
  final RegisterModel _register;
  static RegisterPageController? _this;

  TextEditingController nameController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  factory RegisterPageController([StateMVC? state]) =>
      _this ??= RegisterPageController._(state);

  RegisterPageController._(StateMVC? state)
      : _register = RegisterModel(),
        super(state);

  get name => _register.name;
  get email => _register.email;
  get password => _register.password;
  get checked => _register.checked;

  void update() => setState(() {});

  void setChecked(bool checked) {
    _register.checked = checked;
    update();
  }

  void onConfirmRegister(
      String name, String email, String password, BuildContext context) {
    _register.name = name;
    debugPrint("debugging name: ${_register.name}");
    _register.email = email;
    debugPrint("debugging id: ${_register.email}");
    _register.password = password;
    debugPrint("debugging password: ${_register.password}");

    if (_register.checked) {
      _register.signUp();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Fluttertoast.showToast(msg: "개인정보 제공 동의가 거부되어 있습니다.");
    }
  }
}
