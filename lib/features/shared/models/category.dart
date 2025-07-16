class Category {
  int id;
  String name;
  String icon;
  bool isFollowed;

  Category({
    required this.id,
    required this.name,
    required this.icon,
    required this.isFollowed,
  });

  // Factory method to create a Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      icon: json['icon'],
      isFollowed: json['is_followed'],
    );
  }

  // Method to convert Category to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'icon': icon,
      'is_followed': isFollowed,
    };
  }
}
