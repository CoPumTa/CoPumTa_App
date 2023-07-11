import 'package:flutter/foundation.dart';

class TimerProvider with ChangeNotifier {
  int _flowTime = 0;

  int get flowTime => _flowTime;

  void setFlowTime(int flowTime) {
    this._flowTime = flowTime;
    debugPrint("업데이트된 flowTime: ${this.flowTime}");
    notifyListeners(); // 상태 변경을 알립니다.
  }
}
