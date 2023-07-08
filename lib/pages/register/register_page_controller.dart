import 'package:client/models/register_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RegisterPageController extends ControllerMVC {
  final RegisterModel _register;
  static RegisterPageController? _this;

  factory RegisterPageController([StateMVC? state]) =>
      _this ??= RegisterPageController._(state);

  RegisterPageController._(StateMVC? state)
      : _register = RegisterModel(),
        super(state);

  get id => _register.id;
  get password => _register.password;
  get checked => _register.checked;

  void update() => setState(() {});

  void setId(String id) {
    _register.id = id;
    update();
  }

  void setPassword(String password) {
    _register.password = password;
    update();
  }

  void setChecked(bool checked) {
    _register.checked = checked;
    update();
  }
}
