class CountryBookCountModel {
  final String countryCode;
  final int bookCount;

  CountryBookCountModel({
    required this.countryCode,
    required this.bookCount,
  });

  factory CountryBookCountModel.fromJson(Map<String, dynamic> json) {
    return CountryBookCountModel(
      countryCode: json['country_code'],
      bookCount: json['book_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country_code': countryCode,
      'book_count': bookCount,
    };
  }
}
