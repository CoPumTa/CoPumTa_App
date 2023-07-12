import 'dart:math';

import 'package:client/data/constant.dart';
import 'package:client/style.dart';
import 'package:flutter/material.dart';
import 'package:client/utils.dart';

class FriendWidget extends StatelessWidget {
  String imageSourceLink =
      FRIENDS_IMAGES[Random().nextInt(FRIENDS_IMAGES.length)];
  final FriendInfo friend;
  FriendWidget({super.key, required this.friend});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 96,
        height: 110,
        child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(imageSourceLink,
              width: 56,
              height: 56,
              opacity: (friend.isFlowing
                  ? const AlwaysStoppedAnimation<double>(1.0)
                  : const AlwaysStoppedAnimation<double>(0.25))),
          SizedBox(height: 4.0),
          Text(friend.userName,
              style: KorTextStyles.smallMain, textAlign: TextAlign.center),
          Text(friend.todaysTime,
              style: KorTextStyles.smallMain, textAlign: TextAlign.center)
        ])));
  }
}
