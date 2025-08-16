class NotificationModel {
  final int id;
  final String title;
  final String description;
  final DateTime dateTime;
  final bool isRead;
  final String? category; // 'info', 'success', 'warning', 'error'

  NotificationModel({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTime,
    this.isRead = false,
    this.category,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      dateTime:
          DateTime.parse(json['date_time'] ?? DateTime.now().toIso8601String()),
      isRead: json['is_read'] ?? false,
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date_time': dateTime.toIso8601String(),
      'is_read': isRead,
      'category': category,
    };
  }

  String get timeAgo {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }

  String get formattedDate {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String get formattedTime {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  String toString() {
    return 'NotificationModel(id: $id, title: $title, isRead: $isRead)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.dateTime == dateTime &&
        other.isRead == isRead &&
        other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        dateTime.hashCode ^
        isRead.hashCode ^
        category.hashCode;
  }

  NotificationModel copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? dateTime,
    bool? isRead,
    String? category,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      isRead: isRead ?? this.isRead,
      category: category ?? this.category,
    );
  }
}
