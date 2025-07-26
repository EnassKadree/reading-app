class UserChallenge {
  final int id;
  final String title;
  final String description;
  final int points;
  final int timeLeft;
  final int percentage;

  UserChallenge({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.timeLeft,
    required this.percentage,
  });

  factory UserChallenge.fromJson(Map<String, dynamic> json) {
    return UserChallenge(
      id: json['id'],
      title: json['title'],
      description:  json['description'],
      points: json['points'],
      timeLeft: json['time_left'],
      percentage: json['percentage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'points': points,
      'time_left': timeLeft,
      'percentage': percentage,
    };
  }
}
