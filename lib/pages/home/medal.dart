import 'package:client/widgets/gap.dart';
import 'package:flutter/material.dart';

class Medal extends StatelessWidget {
  final String imageSource;
  final String userName;

  const Medal({super.key, required this.imageSource, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        imageSource,
        width: 48,
        fit: BoxFit.cover,
      ),
      const Gap(height: 8),
      Text(userName)
    ]);
  }
}
