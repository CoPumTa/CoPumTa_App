class TypicodeTestModel {
  int _userId = 0;
  int _id = 0;
  String _title = "";
  String _body = "";

  int get userId => _userId;

  set userId(int value) {
    _userId = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  String get body => _body;

  set body(String value) {
    _body = value;
  }

  TypicodeTestModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  factory TypicodeTestModel.fromJson(Map<String, dynamic> json) {
    print(json);
    return TypicodeTestModel(
        userId: json['userId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String);
  }
}
