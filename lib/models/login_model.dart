class LoginModel {
  String _id = "";
  String _password = "";
  String _data = "";

  get id => _id;
  get password => _password;
  String get data => _data;

  String setId(String id) => (_id = id);
  String setPassword(String password) => (_password = password);
  set data(String value) {
    _data = value;
  }
}
