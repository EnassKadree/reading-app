part of 'community_cubit.dart';

@immutable
sealed class CommunityState {}

final class CommunityInitial extends CommunityState {}

final class CommunityLoading extends CommunityState {}

final class CommunityFailure extends CommunityState {
  final String message;

  CommunityFailure(this.message);
}

final class CommunitySuccess extends CommunityState {
  final List<ProfileModel> profiles;

  CommunitySuccess(this.profiles);
}
