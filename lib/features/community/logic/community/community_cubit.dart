import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

part 'community_state.dart';

class CommunityCubit extends BaseCubit<CommunityState> {
  CommunityCubit() : super(CommunityInitial());

  final TextEditingController searchController = TextEditingController();
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.community}';
  bool isArranged = true;

  Future getCommunity([String? search]) async {
    executeWithCatch(
        action: () async {
          emit(CommunityLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }

          Map<String, dynamic> response =
              await Api().getWithToken(url: endPoint, token: user.accessToken);
          List<ProfileModel> profile = parseResponse<ProfileModel>(
              response: response,
              fromJson: (data) => ProfileModel.fromJson(data));
          emit(CommunitySuccess(profiles: profile));
        },
        emit: emit,
        failureStateBuilder: (message) => CommunityFailure(message));
  }

  void searchLocally(String query) {
    if (state is CommunitySuccess) {
      final currentState = state as CommunitySuccess;

      if (query.isEmpty) {
        // If search is empty, show all profiles and reset search state
        emit(currentState.copyWith(
          filteredProfiles: [],
          searchQuery: '',
          isSearching: false,
        ));
        isArranged = true; // Reset arrangement when search is cleared
      } else {
        // Filter profiles locally based on search query
        final filteredProfiles = currentState.profiles.where((profile) {
          final searchLower = query.toLowerCase();
          final fullName =
              '${profile.firstName} ${profile.lastName}'.toLowerCase();
          return fullName.contains(searchLower) ||
              profile.nickname.toLowerCase().contains(searchLower) ||
              profile.bio.toLowerCase().contains(searchLower);
        }).toList();

        emit(currentState.copyWith(
          filteredProfiles: filteredProfiles,
          searchQuery: query,
          isSearching: true,
        ));
        isArranged = false; // Set arrangement to false while searching
      }
    }
  }

  void clearSearch() {
    if (state is CommunitySuccess) {
      final currentState = state as CommunitySuccess;
      emit(currentState.copyWith(
        filteredProfiles: [],
        searchQuery: '',
        isSearching: false,
      ));
      isArranged = true; // Reset arrangement when search is cleared
      searchController.clear();
    }
  }

  @override
  Future<void> close() {
    searchController.dispose();
    return super.close();
  }
}
