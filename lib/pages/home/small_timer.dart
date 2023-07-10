import 'package:client/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SmallTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("00:00:00",
            style: TextStyle(fontSize: 54, fontWeight: FontWeight.w700)),
        MaterialButton(
            color: subColor,
            onPressed: () {},
            shape: const CircleBorder(),
            child: const Icon(CupertinoIcons.play),
            height: 50)
      ],
    ));
  }
}
