import 'package:client/data/models/home_model.dart';
import 'package:client/data/models/top_friend.dart';
import 'package:client/pages/home/home_page_controller.dart';
import 'package:client/pages/home/medal.dart';
import 'package:client/pages/timer/timer.dart';
import 'package:client/style.dart';
import 'package:client/widgets/widgetWithTopLeftHeading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

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

  // TODO: todayStopWatch에 currentStopWatch를 더하는게 아니라, dispose될 때 todayStopWatch를 disk에 저장해야함

  @override
  Widget build(BuildContext context) {
    List<TopFriend> topFriends = homePageController.topFriends;
    return Column(children: [
      // Timer
      Container(
          height: 150,
          color: mainColor,
          child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      children: [
                        SizedBox(
                          width: 8.0,
                        ),
                        Text("Today\'s", style: TextStyles.Hint)
                      ],
                    ),
                    // WidgetWithTopLeftHeading(
                    // heading: "Start Flow",
                    // widget:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<int>(
                              stream: homePageController.todayStopWatch.rawTime,
                              initialData: homePageController
                                  .todayStopWatch.rawTime.value,
                              builder: (context, snap) {
                                final value = snap.data!;
                                final displayTime =
                                    StopWatchTimer.getDisplayTime(value,
                                        milliSecond: false);
                                return Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    displayTime,
                                    style: const TextStyle(
                                        fontSize: 54,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white),
                                  ),
                                );
                              }),
                          SizedBox(width: 16.0),
                          Container(
                              width: 44,
                              height: 44,
                              child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Timer(
                                                  todayStopWatch:
                                                      homePageController
                                                          .todayStopWatch,
                                                )));
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: darkColor,
                                      shadowColor: Colors.transparent,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0))),
                                  child: const Icon(CupertinoIcons.play,
                                      size: 24, color: Colors.white)))
                        ]),
                    // )
                  ]))),

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
      // Card(
      //   color: Colors.white,
      //   shape:
      //       RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      //   shadowColor: Colors.transparent,
      //   margin: EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
      //   child: Padding(
      //       padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
      //       child: WidgetWithTopLeftHeading(
      //           heading: "My Flow of Programming",
      //           widget:
      //               SvgPicture.network("http://ghchart.rshah.org/coitloz88"))),
      // ),
    ]);
  }
}
