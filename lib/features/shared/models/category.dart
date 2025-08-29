class CategoryModel {
  int id;
  String name;
  String icon;
  bool isFollowed;

  CategoryModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.isFollowed,
  });

  // Factory method to create a Category from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      icon: json['icon'] ?? '',
      isFollowed: json['is_followed'] ?? false, // <-- FIX
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
