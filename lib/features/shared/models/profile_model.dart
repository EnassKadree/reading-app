import 'badge_model.dart';

class ProfileModel {
  final int userId;
  final String firstName;
  final String lastName;
  final String picture;
  final String nickname;
  final String bio;
  final String quote;
  final int booksNumber;
  final int countriesNumber;
  final int challengesNumber;
  final int totalPoints;
  final List<BadgeModel> badges;

  ProfileModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.nickname,
    required this.bio,
    required this.quote,
    required this.booksNumber,
    required this.countriesNumber,
    required this.challengesNumber,
    required this.totalPoints,
    required this.badges,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      picture: json['picture'] ?? '',
      nickname: json['nickname'] ?? '',
      bio: json['bio'] ?? '',
      quote: json['quote'] ?? '',
      booksNumber: json['books_number'] ?? 0,
      countriesNumber: json['countries_number'] ?? 0,
      challengesNumber: json['challenges_number'] ?? 0,
      totalPoints: json['total_points'] ?? 0,
      badges: BadgeModel.fromList(json['badges'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'picture': picture,
      'nickname': nickname,
      'bio': bio,
      'quote': quote,
      'books_number': booksNumber,
      'countries_number': countriesNumber,
      'challenges_number': challengesNumber,
      'total_points': totalPoints,
      'badges': badges.map((badge) => badge.toJson()).toList(),
    };
  }

  static List<ProfileModel> fromList(List<dynamic> data) {
    return data.map((item) => ProfileModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return 'ProfileModel(id: $userId, firstName: $firstName, lastName: $lastName, picture: $picture, nickname: $nickname, bio: $bio, quote: $quote, booksNumber: $booksNumber, countriesNumber: $countriesNumber, challengesNumber: $challengesNumber, totalPoints: $totalPoints, badges: $badges)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ProfileModel &&
        other.userId == userId &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.picture == picture &&
        other.nickname == nickname &&
        other.bio == bio &&
        other.quote == quote &&
        other.booksNumber == booksNumber &&
        other.countriesNumber == countriesNumber &&
        other.challengesNumber == challengesNumber &&
        other.totalPoints == totalPoints &&
        other.badges == badges;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        picture.hashCode ^
        nickname.hashCode ^
        bio.hashCode ^
        quote.hashCode ^
        booksNumber.hashCode ^
        countriesNumber.hashCode ^
        challengesNumber.hashCode ^
        totalPoints.hashCode ^
        badges.hashCode;
  }

  ProfileModel copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    String? picture,
    String? nickname,
    String? bio,
    String? quote,
    int? booksNumber,
    int? countriesNumber,
    int? challengesNumber,
    int? totalPoints,
    List<BadgeModel>? badges,
  }) {
    return ProfileModel(
      userId: userId ?? this.userId,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.firstName,
      picture: picture ?? this.picture,
      nickname: nickname ?? this.nickname,
      bio: bio ?? this.bio,
      quote: quote ?? this.quote,
      booksNumber: booksNumber ?? this.booksNumber,
      countriesNumber: countriesNumber ?? this.countriesNumber,
      challengesNumber: challengesNumber ?? this.challengesNumber,
      totalPoints: totalPoints ?? this.totalPoints,
      badges: badges ?? this.badges,
    );
  }
}
