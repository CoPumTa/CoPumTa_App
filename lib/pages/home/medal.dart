import 'package:client/style.dart';
import 'package:flutter/material.dart';

class Medal extends StatelessWidget {
  final String imageSource;
  final String userName;
  final String flowTime;

  const Medal(
      {super.key,
      required this.imageSource,
      required this.userName,
      required this.flowTime});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        imageSource,
        width: 54,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 8),
      Text(userName, style: TextStyles.Main),
      Text(flowTime, style: TextStyles.Hint),
    ]);
  }
}
