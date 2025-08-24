class LibraryStats {
  final double averageRating;
  final int sumBooks;

  LibraryStats({
    required this.averageRating,
    required this.sumBooks,
  });


  factory LibraryStats.fromJson(Map<String, dynamic> json) {
    return LibraryStats(
      averageRating: (json['average_rating'] as num).toDouble(),
      sumBooks: json['sum_books'] as int,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'average_rating': averageRating,
      'sum_books': sumBooks,
    };
  }
}
