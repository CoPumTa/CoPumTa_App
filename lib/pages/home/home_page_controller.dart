import 'package:client/data/models/home_model.dart';
import 'package:client/data/models/top_friend.dart';
import 'package:client/utils.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageController extends ControllerMVC {
  final HomeModel _homeModel;
  static HomePageController? _this;

  factory HomePageController([StateMVC? state]) =>
      _this ??= HomePageController._(state);

  HomePageController._(StateMVC? state)
      : _homeModel = HomeModel(),
        super(state);

  List<FriendInfo> getTopFriends() {
    return _homeModel.topFriends;
  }

  Future<void> fetchTopFriends() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? cookie = prefs.getString("session");

    if (cookie == null) {
      debugPrint("get friends 하는 도중 로그아웃");
      _homeModel.topFriends = [FriendInfo(0, "dummy", "00:00:00", false)];
      return;
    }

    List<FriendInfo> friends = await getFriends(cookie);
    friends.sort((a, b) => (b.todaysTime.compareTo(a.todaysTime)));

    if (friends.length < 1) {
      _homeModel.topFriends = [
        FriendInfo(0, "dummy1", "00:00:00", false),
        FriendInfo(0, "dummy2", "00:00:00", false),
        FriendInfo(0, "dummy3", "00:00:00", false)
      ];
    }
    _homeModel.topFriends = List.generate(
        friends.length > 3 ? 3 : friends.length, (index) => friends[index]);
  }

  void update() => setState(() {});
}
