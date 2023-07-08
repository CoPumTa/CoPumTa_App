import 'package:client/style.dart';
import 'package:client/widgets/gap.dart';
import 'package:client/widgets/login_social_button.dart';
import 'package:client/widgets/login_text_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final double gap = 8.0;

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
              LoginTextInput(hintText: 'Email', prefixIcon: Icons.mail),
              Gap(height: gap),
              LoginTextInput(hintText: 'Password', prefixIcon: Icons.lock),
              Gap(height: gap),
              Text("Forgot your password?", style: TextStyles.Hint),
              Gap(height: gap * 2),
              CupertinoButton.filled(child: Text('Login'), onPressed: () {}),
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
                    Text("Don\'t have an account yet?", style: TextStyles.Hint),
                    SizedBox(width: 4.0),
                    Text("Register", style: TextStyles.Main),
                  ])
            ]));
  }
}
