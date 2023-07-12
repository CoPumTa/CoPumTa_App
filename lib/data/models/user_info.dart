class UserInfo {
  int userId = 0;
  String email = "";
  String userName = "";
  String cumulativeTime = "00:00:00";
  String todaysTime = "00:00:00";
  int points = 0;
  String? githubId;
  int? badge;

  static UserInfo? user;

  UserInfo(
      {required this.userId,
      required this.email,
      required this.userName,
      required this.cumulativeTime,
      required this.todaysTime,
      required this.points,
      this.githubId,
      this.badge});

  UserInfo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        email = json['email'],
        userName = json['userName'],
        cumulativeTime = json['cumulativeTime'],
        todaysTime = json['todaysTime'],
        points = json['points'],
        githubId = json['githubId'],
        badge = json['badge'] ?? 0;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['email'] = email;
    data['userName'] = userName;
    data['cumulativeTime'] = cumulativeTime;
    data['todaysTime'] = todaysTime;
    data['points'] = points;
    data['githubId'] = githubId;
    data['badge'] = badge;
    return data;
  }
}
