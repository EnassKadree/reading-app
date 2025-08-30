class BookModel {
  final int id;
  final String title;
  final String description;
  final String authorName;
  final String countryFlag;
  final String publishDate;
  final String coverImage;
  final int points;
  final double starRate;
  final int readersCount;
  final String categoryName;
  final String sizeCategoryName;
  final int numberOfPages;
  final int progress;
   bool isFavourite;
  final bool isChallenged;
   bool isInLibrary;
  final String summary;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.authorName,
    required this.countryFlag,
    required this.publishDate,
    required this.coverImage,
    required this.points,
    required this.starRate,
    required this.readersCount,
    required this.categoryName,
    required this.sizeCategoryName,
    required this.numberOfPages,
    required this.progress,
    required this.isFavourite,
    required this.isChallenged,
    required this.isInLibrary,
    this.summary=''
  });

  // Factory method to convert JSON to Book object
  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      authorName: json['author_name'] ?? 'Unknown',
      countryFlag: json['country_flag'] ?? '',
      publishDate: json['publish_date'] ?? '',
      coverImage: json['cover_image'] ?? '',
      points: json['points'] ?? 0,
      starRate: (json['star_rate'] ?? 0).toDouble(),
      readersCount: json['readers_count'] ?? 0,
      categoryName: json['category_name'] ?? '',
      sizeCategoryName: json['size_category_name'] ?? '',
      numberOfPages: json['number_of_pages'] ?? 0,
      progress: json['progress'] ?? 0,
      isFavourite: json['is_favourite'] ?? false,
      isChallenged: json['is_challenged'] ?? false,
      isInLibrary: json['is_in_library'] ?? false,
      summary: json['summary']??''
    );
  }


  // Method to convert Book object to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author_name': authorName,
      'country_flag': countryFlag,
      'publish_date': publishDate,
      'cover_image': coverImage,
      'points': points,
      'star_rate': starRate,
      'readers_count': readersCount,
      'category_name': categoryName,
      'size_category_name': sizeCategoryName,
      'number_of_pages': numberOfPages,
      'progress': progress,
      'is_favourite': isFavourite,
      'is_challenged': isChallenged,
      'is_in_library': isInLibrary,
      'summary':summary
    };
  }
  static List<BookModel> fromList(List<dynamic> data) {
    return data.map((item) => BookModel.fromJson(item)).toList();
  }
}
