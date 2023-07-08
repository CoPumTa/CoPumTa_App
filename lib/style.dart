import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const blackColor = Color(0xFF000000);
const darkColor = Color(0xFF526D82);
const mainColor = Color(0xFF526D82);
const subColor = Color(0xFF9DB2BF);
const lightColor = Color(0xFFDDE6ED);

const TextStyle kDefaultPlaceholderStyle = TextStyle(
  fontWeight: FontWeight.w400,
  color: CupertinoColors.placeholderText,
);

// Value inspected from Xcode 11 & iOS 13.0 Simulator.
const BorderSide kDefaultRoundedBorderSide = BorderSide(
  color: CupertinoDynamicColor.withBrightness(
    color: Color(0x33000000),
    darkColor: Color(0x33FFFFFF),
  ),
  width: 0.0,
);

const BoxDecoration kDefaultRoundedBorderDecoration = BoxDecoration(
  color: CupertinoDynamicColor.withBrightness(
    color: lightColor,
    darkColor: darkColor,
  ),
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
);

class TextStyles {
  static const Primary =
      TextStyle(fontSize: 20, color: blackColor, fontWeight: FontWeight.w700);
  static const Secondary =
      TextStyle(fontSize: 16, color: darkColor, fontWeight: FontWeight.w700);
  static const Tertiary =
      TextStyle(fontSize: 16, color: mainColor, fontWeight: FontWeight.w500);
  static const Main =
      TextStyle(fontSize: 14, color: mainColor, fontWeight: FontWeight.w400);
  static const MainAccent =
      TextStyle(fontSize: 14, color: blackColor, fontWeight: FontWeight.w400);
  static const Hint =
      TextStyle(fontSize: 14, color: subColor, fontWeight: FontWeight.w400);
  static const Comment =
      TextStyle(fontSize: 12, color: subColor, fontWeight: FontWeight.w400);
}
