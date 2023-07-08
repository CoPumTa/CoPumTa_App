import 'package:client/style.dart';
import 'package:client/widgets/gap.dart';
import 'package:client/widgets/login_social_button.dart';
import 'package:client/widgets/login_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/pages/login/login_page_controller.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends StateMVC<LoginPage> {
  final double gap = 8.0;
  late LoginPageController loginPageController;

  _LoginPageState() : super(LoginPageController()) {
    loginPageController = controller as LoginPageController;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hey there,", style: TextStyles.Secondary),
              Text("Welcome Back", style: TextStyles.Primary),
              Gap(height: gap * 2),
              LoginTextInput(
                hintText: 'Email',
                prefixIcon: Icons.mail,
                controller: loginPageController.idController,
              ),
              Gap(height: gap),
              LoginTextInput(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                controller: loginPageController.passwordController,
              ),
              Gap(height: gap),
              Text("Forgot your password?", style: TextStyles.Comment),
              Gap(height: gap * 2),
              CupertinoButton.filled(
                  child: Text('Login'),
                  onPressed: () {
                    loginPageController.onConfirmLogin(
                        loginPageController.idController.text,
                        loginPageController.passwordController.text);
                  }),
              Gap(height: gap * 2),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 2,
                    decoration: BoxDecoration(
                      color: lightColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                    child: Text(
                      'Or',
                      style: TextStyles.Main,
                    ),
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: 2,
                    decoration: BoxDecoration(
                      color: lightColor,
                    ),
                  ),
                ],
              ),
              Gap(height: gap * 2),
              const Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginSocialButton(
                        imageSource: 'assets/images/logo_google.png'),
                    SizedBox(width: 16.0),
                    LoginSocialButton(
                        imageSource: 'assets/images/logo_kakao.png'),
                  ]),
              Gap(height: gap * 2),
              const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Don\'t have an account yet?", style: TextStyles.Main),
                    SizedBox(width: 4.0),
                    Text("Register", style: TextStyles.MainAccent),
                  ])
            ]));
  }
}
