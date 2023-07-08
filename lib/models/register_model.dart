class RegisterModel {
  bool _checked = false;
  String _id = "";
  String _password = "";

  bool get checked => _checked;
  String get id => _id;
  String get password => _password;

  set id(String id) => (_id = id);
  set password(String password) => (_password = password);
  set checked(bool value) => (_checked = value);
}
