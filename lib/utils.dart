import 'package:intl/intl.dart';

String getToday() {
  DateTime now = DateTime.now();
  DateFormat formatter = DateFormat('yyyy-MM-dd');
  String strToday = formatter.format(now);
  return strToday;
}

String formatMilliseconds(int milliseconds) {
  // 총 밀리초를 시, 분, 초로 변환
  int seconds = (milliseconds / 1000).truncate();
  int minutes = (seconds / 60).truncate();
  int hours = (minutes / 60).truncate();

  // 시, 분, 초를 각각 계산
  seconds = seconds % 60;
  minutes = minutes % 60;

  // HH:MM:SS 형식의 문자열로 변환
  String hoursStr = (hours % 24).toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');

  return '$hoursStr:$minutesStr:$secondsStr';
}
