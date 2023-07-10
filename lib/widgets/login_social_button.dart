import 'package:flutter/material.dart';
import 'package:client/style.dart';

class LoginSocialButton extends StatelessWidget {
  final String imageSource;
  Function onPressedFunction;
  LoginSocialButton(
      {super.key, required this.imageSource, required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsetsDirectional.fromSTEB(26, 26, 26, 26),
        fixedSize: const Size(100, 100),
      ),
      onPressed: () {
        onPressedFunction(context);
      },
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          imageSource,
          width: 24,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
