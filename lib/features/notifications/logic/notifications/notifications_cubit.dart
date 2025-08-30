import 'package:flutter/material.dart';

import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/models/notification_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends BaseCubit<NotificationsState> {
  NotificationsCubit() : super(const NotificationsState());
  final TextEditingController searchController = TextEditingController();

  void initializeNotifications(List<NotificationModel> notifications) {
    emit(state.copyWith(
      notifications: notifications,
      filteredNotifications: notifications,
    ));
  }

  void searchNotifications(String query) {
    if (query.isEmpty) {
      emit(state.copyWith(
        filteredNotifications: state.notifications,
        isSearching: false,
      ));
    } else {
      final filtered = state.notifications.where((notification) {
        return notification.title.toLowerCase().contains(query.toLowerCase()) ||
            notification.description
                .toLowerCase()
                .contains(query.toLowerCase());
      }).toList();

      emit(state.copyWith(
        filteredNotifications: filtered,
        isSearching: true,
      ));
    }
  }

  void clearSearch() {
    emit(state.copyWith(
      filteredNotifications: state.notifications,
      isSearching: false,
    ));
    searchController.text = '';
  }

  void markNotificationAsRead(String notificationId) {
    final updatedNotifications = state.notifications.map((notification) {
      if (notification.id == notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();

    final updatedFilteredNotifications =
        state.filteredNotifications.map((notification) {
      if (notification.id == notificationId) {
        return notification.copyWith(isRead: true);
      }
      return notification;
    }).toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      filteredNotifications: updatedFilteredNotifications,
    ));
  }

  void markAllNotificationsAsRead() {
    final updatedNotifications = state.notifications.map((notification) {
        return notification.copyWith(isRead: true);
    }).toList();

    final updatedFilteredNotifications =
        state.filteredNotifications.map((notification) {
        return notification.copyWith(isRead: true);
    }).toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      filteredNotifications: updatedFilteredNotifications,
    ));
  }

  void dismissNotification(int notificationId) {
    final updatedNotifications = state.notifications
        .where((notification) => notification.id != notificationId)
        .toList();

    final updatedFilteredNotifications = state.filteredNotifications
        .where((notification) => notification.id != notificationId)
        .toList();

    emit(state.copyWith(
      notifications: updatedNotifications,
      filteredNotifications: updatedFilteredNotifications,
    ));
  }

  int get unreadCount {
    return state.notifications.where((n) => !n.isRead).length;
  }

  bool get hasNotifications {
    return state.notifications.isNotEmpty;
  }

  bool get hasFilteredNotifications {
    return state.filteredNotifications.isNotEmpty;
  }
}
