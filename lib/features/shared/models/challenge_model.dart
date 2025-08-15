import 'book.dart';
import 'category.dart';

class ChallengeModel {
  final int id;
  final String title;
  final String description;
  final int pointsEarned;
  final int duration;
  final int numberOfBooks;
  final String? sizeCategoryName;
  final CategoryModel? category;
  final List<BookModel>? books;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.pointsEarned,
    required this.duration,
    required this.numberOfBooks,
    this.sizeCategoryName,
    this.category,
    this.books,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      pointsEarned: json['points_earned'] ?? 0,
      duration: json['duration'] ?? 0,
      numberOfBooks: json['number_of_books'] ?? 0,
      sizeCategoryName: json['size_category_name'],
      category: json['category'] != null
          ? CategoryModel.fromJson(json['category'])
          : null,
      books: json['books'] != null ? BookModel.fromList(json['books']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'points_earned': pointsEarned,
      'duration': duration,
      'number_of_books': numberOfBooks,
      'size_category_name': sizeCategoryName,
      'category': category?.toJson(),
      'books': books?.map((book) => book.toJson()).toList(),
    };
  }

  static List<ChallengeModel> fromList(List<dynamic> data) {
    return data.map((item) => ChallengeModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return 'ChallengeModel(id: $id, title: $title, pointsEarned: $pointsEarned, duration: $duration, numberOfBooks: $numberOfBooks)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChallengeModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.pointsEarned == pointsEarned &&
        other.duration == duration &&
        other.numberOfBooks == numberOfBooks &&
        other.sizeCategoryName == sizeCategoryName &&
        other.category == category &&
        other.books == books;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        pointsEarned.hashCode ^
        duration.hashCode ^
        numberOfBooks.hashCode ^
        sizeCategoryName.hashCode ^
        category.hashCode ^
        books.hashCode;
  }

  ChallengeModel copyWith({
    int? id,
    String? title,
    String? description,
    int? pointsEarned,
    int? duration,
    int? numberOfBooks,
    String? sizeCategoryName,
    CategoryModel? category,
    List<BookModel>? books,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      pointsEarned: pointsEarned ?? this.pointsEarned,
      duration: duration ?? this.duration,
      numberOfBooks: numberOfBooks ?? this.numberOfBooks,
      sizeCategoryName: sizeCategoryName ?? this.sizeCategoryName,
      category: category ?? this.category,
      books: books ?? this.books,
    );
  }
}
