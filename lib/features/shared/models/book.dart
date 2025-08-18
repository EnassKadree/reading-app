class BookModel {
  final int id;
  final String title;
  final String description;
  final String authorName;
  final String countryFlag;
  final String publishDate;
  final String coverImage;
  final double starRate;
  final int readersCount;
  final String categoryName;
  final String sizeCategoryName;
  final int numberOfPages;
  final bool isFavourite;
  final bool isInLibrary;
  final int? progress;

  BookModel({
    required this.id,
    required this.title,
    required this.description,
    required this.authorName,
    required this.countryFlag,
    required this.publishDate,
    required this.coverImage,
    required this.starRate,
    required this.readersCount,
    required this.categoryName,
    required this.sizeCategoryName,
    required this.numberOfPages,
    required this.isFavourite,
    required this.isInLibrary,
    this.progress,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      authorName: json['author_name'] ?? '',
      countryFlag: json['country_flag'] ?? '',
      publishDate: json['publish_date'] ?? '',
      coverImage: json['cover_image'] ?? '',
      starRate: (json['star_rate'] as num?)?.toDouble() ?? 0.0,
      readersCount: json['readers_count'] ?? 0,
      categoryName: json['category_name'] ?? '',
      sizeCategoryName: json['size_category_name'] ?? '',
      numberOfPages: json['number_of_pages'] ?? 0,
      isFavourite: json['is_favourite'] ?? false,
      isInLibrary: json['is_in_library'] ?? false,
      progress: json['progress'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'author_name': authorName,
      'country_flag': countryFlag,
      'publish_date': publishDate,
      'cover_image': coverImage,
      'star_rate': starRate,
      'readers_count': readersCount,
      'category_name': categoryName,
      'size_category_name': sizeCategoryName,
      'number_of_pages': numberOfPages,
      'is_favourite': isFavourite,
      'is_in_library': isInLibrary,
      if (progress != null) 'progress': progress,
    };
  }

  static List<BookModel> fromList(List<dynamic> data) {
    return data.map((item) => BookModel.fromJson(item)).toList();
  }
  BookModel copyWith({
    int? progress,
  }) {
    return BookModel(
      id: id,
      title: title,
      description: description,
      authorName: authorName,
      countryFlag: countryFlag,
      publishDate: publishDate,
      coverImage: coverImage,
      starRate: starRate,
      readersCount: readersCount,
      categoryName: categoryName,
      sizeCategoryName: sizeCategoryName,
      numberOfPages: numberOfPages,
      isFavourite: isFavourite,
      isInLibrary: isInLibrary,
      progress: progress ?? this.progress,
    );
  }

}