import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginTextInput extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  const LoginTextInput(
      {super.key, required this.hintText, required this.prefixIcon, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.0,
        padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
        decoration: kDefaultRoundedBorderDecoration,
        child: (TextFormField(
          controller: controller,
          autofocus: true,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyles.Hint,
              filled: true,
              fillColor: lightColor,
              prefixIcon: Icon(prefixIcon, color: subColor, size: 18)),
          style: TextStyles.Main,
        )));
  }
}
