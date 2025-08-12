class BadgeModel {
  final String title;
  final String icon;

  BadgeModel({
    required this.title,
    required this.icon,
  });

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      title: json['title'] ?? '',
      icon: json['icon'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon': icon,
    };
  }

  static List<BadgeModel> fromList(List<dynamic> data) {
    return data.map((item) => BadgeModel.fromJson(item)).toList();
  }

  @override
  String toString() {
    return 'BadgeModel(title: $title, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BadgeModel && other.title == title && other.icon == icon;
  }

  @override
  int get hashCode {
    return title.hashCode ^ icon.hashCode;
  }

  BadgeModel copyWith({
    String? title,
    String? icon,
  }) {
    return BadgeModel(
      title: title ?? this.title,
      icon: icon ?? this.icon,
    );
  }
}
