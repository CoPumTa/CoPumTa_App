class LoginModel {
  String _id = "";
  String _password = "";

  get id => _id;
  get password => _password;

  String setId(String id) => (_id = id);
  String setPassword(String password) => (_password = password);
}
