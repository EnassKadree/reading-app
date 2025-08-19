class BookChallenge {
  final int id;
  final String description;
  final int points;
  final int duration;

  BookChallenge({
    required this.id,
    required this.description,
    required this.points,
    required this.duration,
  });

  factory BookChallenge.fromJson(Map<String, dynamic> json) {
    return BookChallenge(
      id: json['id'] as int,
      description: json['description'] as String,
      points: json['points'] as int,
      duration: json['duration'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'description': description,
      'points': points,
      'duration': duration,
    };
  }
}