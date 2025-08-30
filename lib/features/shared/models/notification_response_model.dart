import 'notification_model.dart';

class NotificationsResponse {
  final int unreadCount;
  final List<NotificationModel> notifications;

  NotificationsResponse({
    required this.unreadCount,
    required this.notifications,
  });

  factory NotificationsResponse.fromJson(Map<String, dynamic> json) {
    return NotificationsResponse(
      unreadCount: json['unread_count'] ?? 0,
      notifications: (json['notifications'] as List<dynamic>?)
              ?.map((item) => NotificationModel.fromJson(item))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'unread_count': unreadCount,
      'notifications': notifications.map((n) => n.toJson()).toList(),
    };
  }

  NotificationsResponse copyWith({
    int? unreadCount,
    List<NotificationModel>? notifications,
  }) {
    return NotificationsResponse(
      unreadCount: unreadCount ?? this.unreadCount,
      notifications: notifications ?? this.notifications,
    );
  }
}
