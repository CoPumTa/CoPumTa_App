class ChallengeListItemModel {
  final int challengeId;
  final String title;
  final String? subTitle;
  final DateTime startDay;
  final DateTime endDay;
  final int prize;
  final int userId;

  ChallengeListItemModel(
    this.challengeId,
    this.title,
    this.subTitle,
    this.startDay,
    this.endDay,
    this.prize,
    this.userId,
  ); 
}
