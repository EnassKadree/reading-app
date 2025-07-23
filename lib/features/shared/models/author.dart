class Author {
  final int id;
  final String name;
  final String countryName;
  final String image;
  final int numberOfBooks;

  Author({
    required this.id,
    required this.name,
    required this.countryName,
    required this.image,
    required this.numberOfBooks,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'],
      name: json['name'],
      countryName: json['country_name'],
      image: json['image'],
      numberOfBooks: json['number_of_books'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'country_name': countryName,
      'image': image,
      'number_of_books': numberOfBooks,
    };
  }
}
