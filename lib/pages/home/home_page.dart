import 'package:client/pages/home/medal.dart';
import 'package:client/pages/home/small_timer.dart';
import 'package:client/style.dart';
import 'package:client/widgets/gap.dart';
import 'package:client/widgets/widgetWithTopLeftHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double gap = 24.0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // Timer
      SmallTimer(),
      // Ranking
      Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        shadowColor: Colors.transparent,
        margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: WidgetWithTopLeftHeading(
                heading: "Today's Top 3",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Medal(
                        imageSource: "assets/images/image_gold_medal.png",
                        userName: "user 1",
                        flowTime: "00:00:00"),
                    Medal(
                        imageSource: "assets/images/image_silver_medal.png",
                        userName: "user 2",
                        flowTime: "00:00:00"),
                    Medal(
                        imageSource: "assets/images/image_bronze_medal.png",
                        userName: "user 3",
                        flowTime: "00:00:00")
                  ],
                ))),
      ),

      // github contributions
      Card(
        color: Colors.white,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        shadowColor: Colors.transparent,
        margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: WidgetWithTopLeftHeading(
                heading: "My Flow of Programming",
                widget:
                    SvgPicture.network("https://ghchart.rshah.org/coitloz88"))),
      ),
    ]);
  }
}
