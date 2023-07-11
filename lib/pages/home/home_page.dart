import 'package:client/data/models/top_friend.dart';
import 'package:client/pages/home/home_page_controller.dart';
import 'package:client/pages/home/medal.dart';
import 'package:client/pages/home/small_timer.dart';
import 'package:client/style.dart';
import 'package:client/widgets/widgetWithTopLeftHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends StateMVC<HomePage> {
  double gap = 24.0;
  late HomePageController homePageController;

  _HomePageState() : super(HomePageController()) {
    homePageController = controller as HomePageController;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<TopFriend> topFriends = homePageController.topFriends;
    return Column(children: [
      // Timer
      SmallTimer(),
      // Ranking
      Card(
        color: lightColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
            child: WidgetWithTopLeftHeading(
                heading: "Today's Top 3",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Medal(
                        imageSource: "assets/images/image_gold_medal.png",
                        userName: topFriends[0].userName,
                        flowTime: topFriends[0].flowTime),
                    Medal(
                        imageSource: "assets/images/image_silver_medal.png",
                        userName: topFriends[0].userName,
                        flowTime: topFriends[0].flowTime),
                    Medal(
                        imageSource: "assets/images/image_bronze_medal.png",
                        userName: topFriends[0].userName,
                        flowTime: topFriends[0].flowTime)
                  ],
                ))),
      ),

      // github contributions
      Card(
        color: lightColor,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.fromLTRB(16, 16, 16, 4),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
            child: WidgetWithTopLeftHeading(
                heading: "My Flow of Programming",
                widget: Card(
                    color: Color(0x20526D82),
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: SvgPicture.network(
                        // TODO: 유저 정보 받아와서 ID 변경해야함
                        "https://ghchart.rshah.org/coitloz88")))),
      ),
    ]);
  }
}
