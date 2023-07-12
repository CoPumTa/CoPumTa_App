import 'package:client/data/models/top_friend.dart';
import 'package:client/data/models/user_info.dart';
import 'package:client/pages/home/home_page_controller.dart';
import 'package:client/pages/home/medal.dart';
import 'package:client/pages/home/small_timer.dart';
import 'package:client/style.dart';
import 'package:client/utils.dart';
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

  // void getFutureTopFriends(HomePageController controller) async {
  //   _topFriends = await controller.getTopFriends();
  // }

  @override
  void initState() {
    homePageController.fetchTopFriends().then((value) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> topFriendsMedals = List.generate(
        homePageController.getTopFriends().length,
        (i) => Medal(
            imageSource: "assets/images/image_${medalColors[i]}_medal.png",
            userName: homePageController.getTopFriends()[i].userName,
            flowTime: homePageController.getTopFriends()[i].todaysTime));
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
                heading:
                    "Today's Top ${homePageController.getTopFriends().length}",
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: topFriendsMedals,
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
                    child: (UserInfo.user != null &&
                            UserInfo.user!.githubId != null &&
                            UserInfo.user!.githubId!.isNotEmpty)
                        ? SvgPicture.network(
                            "https://ghchart.rshah.org/${UserInfo.user!.githubId}")
                        : SizedBox(
                            height: 100,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("github id를 연동해주세요.",
                                      style: KorTextStyles.Main)
                                ]))))),
      ),
    ]);
  }
}
