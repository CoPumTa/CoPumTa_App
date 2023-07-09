import 'package:flutter/material.dart';
import 'package:client/style.dart';

class LoginSocialButton extends StatefulWidget {
  final String imageSource;
  Function onPressedFunction;
  LoginSocialButton(
      {super.key, required this.imageSource, required this.onPressedFunction});

  @override
  State<LoginSocialButton> createState() => _LoginSocialButtonState();
}

class _LoginSocialButtonState extends State<LoginSocialButton> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsetsDirectional.fromSTEB(26, 26, 26, 26),
        fixedSize: const Size(100, 100),
      ),
      onPressed: () {
        widget.onPressedFunction(context);
      },
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          widget.imageSource,
          width: 24,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
