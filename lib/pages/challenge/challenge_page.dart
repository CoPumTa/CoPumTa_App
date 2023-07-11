import 'package:client/data/models/challenge_list_item_model.dart';
import 'package:client/pages/challenge/challenge_page_controller.dart';
import 'package:flutter/cupertino.dart';

class ChallengePage extends StatefulWidget {

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final _challengePageController = ChallengePageController();

  @override
  void initState() {
    // TODO: implement initState
    _challengePageController.getChallengeList(session);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Text("챌린지 탭");
  }
}
