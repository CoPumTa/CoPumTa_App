import 'package:client/pages/home/medal.dart';
import 'package:client/pages/home/small_timer.dart';
import 'package:client/style.dart';
import 'package:client/widgets/gap.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(children: [
        // Timer
        Flexible(flex: 1, child: SmallTimer()),

        Gap(height: 16),

        // Ranking
        Flexible(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Medal(
                  imageSource: "assets/images/image_gold_medal.png",
                  userName: "user 1"),
              Medal(
                  imageSource: "assets/images/image_silver_medal.png",
                  userName: "user 2"),
              Medal(
                  imageSource: "assets/images/image_bronze_medal.png",
                  userName: "user 3")
            ],
          ),
        ),

        Gap(height: 16),

        // github contributions
        Flexible(
          flex: 2,
          child: Image.network("https://ghchart.rshah.org/coitloz88"),
        ),
      ]),
    );
  }
}
