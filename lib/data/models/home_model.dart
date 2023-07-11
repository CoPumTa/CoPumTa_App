import 'package:client/data/models/top_friend.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

/* 오늘의 StopWatchTimer는 모델의 singleton instance에서 가지고 있음.
나중에 앱이 재실행될 때는 sharedPreference에서 이때까지 카운트한 시간으로 초기화해줌.
currentTimer는 view에서 매번 재생성해주지만.. dispose될 때 이때까지 카운트한 시간을 todayStopWatch에 더해준 뒤 메모리에서 삭제해줌.
 */

class HomeModel {
  // StopWatchTimer _todayStopWatch = StopWatchTimer();

  // StopWatchTimer get todayStopWatch => _todayStopWatch;
  static int flowTime = 0;
  List<TopFriend> _topFriends = [TopFriend(), TopFriend(), TopFriend()];

  List<TopFriend> get topFriends => _topFriends;
}
