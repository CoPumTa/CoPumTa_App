import 'dart:convert';
import 'dart:developer' as dev;

import 'package:client/models/typicode_test_model.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:client/models/login_model.dart';
import 'package:http/http.dart' as http;

class LoginController extends ControllerMVC {
  final LoginModel _login;
  static LoginController? _this;
  String _text = "";

  factory LoginController([StateMVC? state]) =>
      _this ??= LoginController._(state);

  LoginController._(StateMVC? state)
      : _login = LoginModel(),
        super(state);

  get id => _login.id;
  get password => _login.password;
  get text => _text;

  void update() => setState(() {});

  void setId(String id) {
    _login.setId(id);
    dev.log("updated to $id");
    update();
  }

  void setPassword(String password) {
    _login.setPassword(password);
    update();
  }

  Future<void> _getTypicodeDatas() async {
    final String URL = "https://jsonplaceholder.typicode.com/";
    final request = Uri.parse(URL + "posts/1");

    try {
      final response = await http.get(request);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        TypicodeTestModel result = TypicodeTestModel.fromJson(data);
      }
    } catch (error) {}
  }

  Future<void> getData() async {
    // TODO: id를 받아와서 해당되는 json data만 보여주도록 함
    _getTypicodeDatas();
    update();
  }
}
