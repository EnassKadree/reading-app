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
  final List<ProfileModel> filteredProfiles;
  final String searchQuery;
  final bool isSearching;

  CommunitySuccess({
    required this.profiles,
    this.filteredProfiles = const [],
    this.searchQuery = '',
    this.isSearching = false,
  });

  CommunitySuccess copyWith({
    List<ProfileModel>? profiles,
    List<ProfileModel>? filteredProfiles,
    String? searchQuery,
    bool? isSearching,
  }) {
    return CommunitySuccess(
      profiles: profiles ?? this.profiles,
      filteredProfiles: filteredProfiles ?? this.filteredProfiles,
      searchQuery: searchQuery ?? this.searchQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }
}
