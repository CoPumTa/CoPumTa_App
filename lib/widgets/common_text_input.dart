import 'package:client/style.dart';
import 'package:flutter/material.dart';

class CommonTextInput extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final TextEditingController controller;
  bool? hideInput = false;

  CommonTextInput(
      {super.key,
      required this.hintText,
      required this.prefixIcon,
      required this.controller,
      this.hideInput});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 50.0,
        padding: EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 3.0),
        decoration: kDefaultRoundedBorderDecoration,
        child: (TextFormField(
          obscureText: hideInput ?? false,
          controller: controller,
          autofocus: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyles.Hint,
              filled: true,
              fillColor: lightColor,
              prefixIcon: Icon(prefixIcon, color: subColor, size: 18)),
          style: TextStyles.Main,
        )))
    );
  }
}
