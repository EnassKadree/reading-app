import 'dart:convert';
import 'book.dart';
import 'category.dart';

class ChallengeModel {
  final int id;
  final String title;
  final String description;
  final int points;
  final int duration;
  final int numberOfBooks;
  final String? sizeCategoryName;
  final bool isChallenged;
  final CategoryModel? category;
  final List<BookModel>? books;

  ChallengeModel({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.duration,
    required this.numberOfBooks,
    this.sizeCategoryName,
    required this.isChallenged,
    this.category,
    this.books,
  });

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      points: json['points'] ?? 0,
      duration: json['duration'] ?? 0,
      numberOfBooks: json['number_of_books'] ?? 0,
      sizeCategoryName: json['size_category_name'] ?? '',
      isChallenged: json['is_challenged'] ?? false,
      category: CategoryModel.fromJson(json['category'] ?? {}),
      books: (json['books'] as List<dynamic>?)
              ?.map((book) => BookModel.fromJson(book))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'points': points,
      'duration': duration,
      'number_of_books': numberOfBooks,
      'size_category_name': sizeCategoryName,
      'is_challenged': isChallenged,
      'category': category?.toJson(),
      'books': books?.map((book) => book.toJson()).toList(),
    };
  }

  factory ChallengeModel.fromJsonString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return ChallengeModel.fromJson(json);
  }

  String toJsonString() {
    return jsonEncode(toJson());
  }

  ChallengeModel copyWith({
    int? id,
    String? title,
    String? description,
    int? points,
    int? duration,
    int? numberOfBooks,
    String? sizeCategoryName,
    bool? isChallenged,
    CategoryModel? category,
    List<BookModel>? books,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      points: points ?? this.points,
      duration: duration ?? this.duration,
      numberOfBooks: numberOfBooks ?? this.numberOfBooks,
      sizeCategoryName: sizeCategoryName ?? this.sizeCategoryName,
      isChallenged: isChallenged ?? this.isChallenged,
      category: category ?? this.category,
      books: books ?? this.books,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChallengeModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.points == points &&
        other.duration == duration &&
        other.numberOfBooks == numberOfBooks &&
        other.sizeCategoryName == sizeCategoryName &&
        other.isChallenged == isChallenged &&
        other.category == category &&
        other.books == books;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        points.hashCode ^
        duration.hashCode ^
        numberOfBooks.hashCode ^
        sizeCategoryName.hashCode ^
        isChallenged.hashCode ^
        category.hashCode ^
        books.hashCode;
  }

  @override
  String toString() {
    return 'ChallengeModel(id: $id, title: $title, description: $description, points: $points, duration: $duration, numberOfBooks: $numberOfBooks, sizeCategoryName: $sizeCategoryName, isChallenged: $isChallenged, category: $category, books: $books)';
  }
}
