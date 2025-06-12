class User {
  final String tokenType;
  final String accessToken;

  User({
    required this.tokenType,
    required this.accessToken,
  });

  Map<String, dynamic> toMap() {
    return {
      "token_type": tokenType,
      "access_token": accessToken
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      tokenType: map['token_type'],
      accessToken: map['access_token'],
    );
  }
}
