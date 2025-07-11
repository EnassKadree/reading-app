class User {
  final String accessToken;

  User({
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return {
      "token": accessToken
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      accessToken: map['token'],
    );
  }
}
