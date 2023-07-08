class RegisterModel {
  bool _checked = false;
  String _name = "";
  String _id = "";
  String _password = "";

  bool get checked => _checked;
  String get name => _name;
  String get id => _id;
  String get password => _password;

  set name(String name) => (_name = name);
  set id(String id) => (_id = id);
  set password(String password) => (_password = password);
  set checked(bool value) => (_checked = value);
}
