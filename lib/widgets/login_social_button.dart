import 'package:flutter/material.dart';
import 'package:client/style.dart';

class LoginSocialButton extends StatelessWidget {
  final String imageSource;
  const LoginSocialButton({super.key, required this.imageSource});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          color: subColor,
          width: 0.8,
        ),
      ),
      width: 100,
      height: 100,
      alignment: AlignmentDirectional(0, 0),
      child: Align(
        alignment: AlignmentDirectional(0, 0),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(26, 26, 26, 26),
          child: Image.asset(
            imageSource,
            width: 24,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
