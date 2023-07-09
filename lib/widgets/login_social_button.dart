import 'package:flutter/material.dart';
import 'package:client/style.dart';

class LoginSocialButton extends StatelessWidget {
  final String imageSource;
  final Function onPressed;
  const LoginSocialButton(
      {super.key, required this.imageSource, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsetsDirectional.fromSTEB(26, 26, 26, 26),
        fixedSize: const Size(100, 100),
      ),
      onPressed: () => onPressed,
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
