import 'package:client/data/models/user_info.dart';
import 'package:client/pages/home/friend_widget.dart';
import 'package:client/pages/home/home_page_controller.dart';
import 'package:client/pages/home/medal.dart';
import 'package:client/pages/home/small_timer.dart';
import 'package:client/style.dart';
import 'package:client/widgets/common_text_input.dart';
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
  List<String> medalColors = ['gold', 'silver', 'bronze'];

  _HomePageState() : super(HomePageController()) {
    homePageController = controller as HomePageController;
  }

  @override
  void initState() {
    homePageController.fetchTopFriends().then((value) => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> topFriendsMedals = List.generate(
        homePageController.getTopFriends().length,
        (i) => Medal(
            imageSource: "assets/images/image_${medalColors[i]}_medal.png",
            userName: homePageController.getTopFriends()[i].userName,
            flowTime: homePageController.getTopFriends()[i].todaysTime));

    List<Widget> friendsWidget = List.generate(
        homePageController.getAllFriends().length,
        (i) => FriendWidget(friend: homePageController.getAllFriends()[i]));

    return Column(children: [
      // Timer
      SmallTimer(),
      Expanded(
        child: SingleChildScrollView(
            child: Column(children: [
          // Ranking
          Card(
            color: lightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: WidgetWithTopLeftHeading(
                    heading:
                        "Today's Top ${homePageController.getTopFriends().length}",
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: topFriendsMedals.length > 0
                          ? topFriendsMedals
                          : [
                              const SizedBox(
                                  height: 100,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("친구가 없습니다.",
                                            style: KorTextStyles.Main)
                                      ]))
                            ],
                    ))),
          ),

          // Flowing Friends
          Card(
            color: lightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: WidgetWithTopLeftHeading(
                    heading: "Flowing Friends!",
                    widget: homePageController.getAllFriends().length > 0
                        ? SizedBox(
                            width: double.infinity,
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: friendsWidget,
                            ),
                          )
                        : const SizedBox(
                            height: 100,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("친구가 없습니다.", style: KorTextStyles.Main)
                                ])))),
          ),

          // request friends
          Card(
            color: lightColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          // TODO: show dialogue
                        },
                        child: Expanded(
                            child:
                                Text("Add Friends", style: TextStyles.Main))),
                    Container(
                        width: 6, height: double.infinity, color: mainColor),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: Colors.transparent,
                            backgroundColor: Colors.transparent),
                        onPressed: () {
                          //TODO: Navigator.push(친구 신청 수락 페이지);
                        },
                        child: Expanded(
                            child: Text("Accept Request",
                                style: TextStyles.Main))),
                  ],
                )),
          ),

          // github contributions
          Card(
              color: lightColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
                  child: WidgetWithTopLeftHeading(
                      heading: "My Flow of Programming",
                      widget: (UserInfo.user != null &&
                              UserInfo.user!.githubId != null &&
                              UserInfo.user!.githubId!.isNotEmpty)
                          ? Card(
                              color: Color(0x20526D82),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: SvgPicture.network(
                                  "https://ghchart.rshah.org/${UserInfo.user!.githubId}"))
                          : Card(
                              color: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: const SizedBox(
                                  height: 100,
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("github id를 연동해주세요.",
                                            style: KorTextStyles.Main)
                                      ])))))),
        ])),
      ),
    ]);
  }
}
