import 'package:client/data/models/register_model.dart';
import 'package:client/data/models/social_login_model.dart';
import 'package:client/data/providers/auth_provider.dart';
import 'package:client/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

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
  get email => _register.email;
  get password => _register.password;
  get checked => _register.checked;

  void update() => setState(() {});

  void setChecked(bool checked) {
    _register.checked = checked;
    update();
  }

  void onRegisterGoogle() {}
  void onRegisterKakao(BuildContext context) async {
    User? snsUser = await _socialLoginModel.socialLogin();
    if (snsUser != null) {
      _register.signUpWithSnsId(
          snsUser.kakaoAccount?.profile?.nickname.toString(),
          snsUser.kakaoAccount?.email,
          snsUser.id.toString(),
          "kakao");
    } else {
      Fluttertoast.showToast(msg: "카카오 소셜 로그인에 실패했습니다.");
    }
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
      update();
    } else {
      Fluttertoast.showToast(msg: "개인정보 제공 동의가 거부되어 있습니다.");
    }
  }
}
