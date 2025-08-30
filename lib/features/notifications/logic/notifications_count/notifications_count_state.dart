part of 'notifications_count_cubit.dart';

@immutable
sealed class NotificationsCountState {}

final class NotificationsCountInitial extends NotificationsCountState {}

final class NotificationsCountFailure extends NotificationsCountState 
{
  final String message;
  NotificationsCountFailure(this.message);
}

final class NotificationsCountLoading extends NotificationsCountState {}

final class NotificationsCountSuccess extends NotificationsCountState {
  final int count;
  NotificationsCountSuccess(this.count);
}
