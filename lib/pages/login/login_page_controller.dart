import 'package:client/data/models/social_login_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:client/data/models/login_model.dart';

class LoginPageController extends ControllerMVC {
  final LoginModel _login;
  static LoginPageController? _this;
  final SocialLoginModel _socialLoginModel;

  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  factory LoginPageController([StateMVC? state]) =>
      _this ??= LoginPageController._(state);

  LoginPageController._(StateMVC? state)
      : _login = LoginModel(),
        _socialLoginModel = SocialLoginModel(),
        super(state);

  get email => _login.email;
  get password => _login.password;

  void update() => setState(() {});

  void onLoginGoogle() {}
  void onLoginKakao(BuildContext context) async {
    User? snsUser = await _socialLoginModel.socialLogin();
    if (snsUser != null) {
      _socialLoginModel.login(
          context, snsUser.kakaoAccount?.email, snsUser.id.toString(), "kakao");
    } else {
      Fluttertoast.showToast(msg: "카카오 소셜 로그인에 실패했습니다.");
    }

    update();
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
