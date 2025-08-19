part of 'setup_profile_cubit.dart';

@immutable
sealed class SetupProfileState {}

final class SetupProfileInitial extends SetupProfileState {}

final class SetupProfileLoading extends SetupProfileState {}

final class SetupProfileSuccess extends SetupProfileState {}

final class SetupProfileImagePicked extends SetupProfileState {
  final File image;
  SetupProfileImagePicked(this.image);
}

final class SetupProfileFailure extends SetupProfileState {
  final String message;
  SetupProfileFailure(this.message);
}
