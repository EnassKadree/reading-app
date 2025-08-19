part of 'complaints_cubit.dart';

@immutable
sealed class ComplaintsState {}

final class ComplaintsInitial extends ComplaintsState {}

final class ComplaintsLoading extends ComplaintsState {}

final class ComplaintsFailure extends ComplaintsState {
  final String message;
  ComplaintsFailure(this.message);
}

final class ComplaintsSuccess extends ComplaintsState {
  final String message;
  ComplaintsSuccess(this.message);
}
