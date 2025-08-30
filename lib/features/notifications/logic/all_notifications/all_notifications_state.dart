part of 'all_notifications_cubit.dart';

@immutable
sealed class AllNotificationsState {}

final class AllNotificationsInitial extends AllNotificationsState {}

final class AllNotificationsLoading extends AllNotificationsState {}

final class AllNotificationsFailure extends AllNotificationsState {
  final String message;
  AllNotificationsFailure(this.message);
}

final class AllNotificationsSuccess extends AllNotificationsState {
  final NotificationsResponse notifications;
  AllNotificationsSuccess(this.notifications);
}
