part of 'notifications_cubit.dart';

class NotificationsState {
  final List<NotificationModel> notifications;
  final List<NotificationModel> filteredNotifications;
  final bool isSearching;

  const NotificationsState({
    this.notifications = const [],
    this.filteredNotifications = const [],
    this.isSearching = false,
  });

  NotificationsState copyWith({
    List<NotificationModel>? notifications,
    List<NotificationModel>? filteredNotifications,
    bool? isSearching,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      filteredNotifications:
          filteredNotifications ?? this.filteredNotifications,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is NotificationsState &&
        other.notifications == notifications &&
        other.filteredNotifications == filteredNotifications &&
        other.isSearching == isSearching;
  }

  @override
  int get hashCode {
    return notifications.hashCode ^
        filteredNotifications.hashCode ^
        isSearching.hashCode;
  }
}
