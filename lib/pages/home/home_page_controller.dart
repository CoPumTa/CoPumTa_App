import 'package:client/data/models/home_model.dart';
import 'package:client/data/models/top_friend.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomePageController extends ControllerMVC {
  final HomeModel _homeModel;
  static HomePageController? _this;

  factory HomePageController([StateMVC? state]) =>
      _this ??= HomePageController._(state);

  HomePageController._(StateMVC? state)
      : _homeModel = HomeModel(),
        super(state);

  // StopWatchTimer get todayStopWatch => _homeModel.todayStopWatch;
  List<TopFriend> get topFriends => _homeModel.topFriends;

  void update() => setState(() {});
}
