import 'package:client/pages/login/login_page.dart';
import 'package:client/pages/register/register_page_controller.dart';
import 'package:client/style.dart';
import 'package:client/widgets/checkbox_with_comment.dart';
import 'package:client/widgets/gap.dart';
import 'package:client/widgets/login_social_button.dart';
import 'package:client/widgets/login_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends StateMVC<RegisterPage> {
  final double gap = 8.0;

  late RegisterPageController registerPageController;

  _RegisterPageState() : super(RegisterPageController()) {
    registerPageController = controller as RegisterPageController;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(30, 0, 30, 0),
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Hey there,", style: TextStyles.Secondary),
                  Text("Create an account", style: TextStyles.Primary),
                  Gap(height: gap * 2),
                  LoginTextInput(
                    hintText: 'Name',
                    prefixIcon: Icons.person,
                    controller: registerPageController.nameController,
                  ),
                  Gap(height: gap),
                  LoginTextInput(
                    hintText: 'Email',
                    prefixIcon: Icons.mail,
                    controller: registerPageController.idController,
                  ),
                  Gap(height: gap),
                  LoginTextInput(
                    hintText: 'Password',
                    prefixIcon: Icons.lock,
                    controller: registerPageController.passwordController,
                  ),
                  Gap(height: gap),
                  CheckboxWithComment(
                    comment:
                        "By continuing you accept our Privacy Policy and Term of Use.",
                    checkboxController: registerPageController,
                  ),
                  Gap(height: gap * 2),
                  CupertinoButton.filled(
                      child: Text('Register'),
                      onPressed: () {
                        registerPageController.onConfirmRegister(
                            registerPageController.nameController.text,
                            registerPageController.idController.text,
                            registerPageController.passwordController.text);
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Already have an account?",
                            style: TextStyles.Main),
                        TextButton(
                            style: TextButton.styleFrom(
                                textStyle: TextStyles.MainAccent),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text("Login")),
                      ])
                ])));
  }
}
