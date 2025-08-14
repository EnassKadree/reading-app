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
  bool isArranged = true;

  Future getCommunity([String? search]) async {
    executeWithCatch(
        action: () async {
          emit(CommunityLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }

          String url = _handleParams(search);

          Map<String, dynamic> response =
              await Api().getWithToken(url: url, token: user.accessToken);
          List<ProfileModel> profile = parseResponse<ProfileModel>(
              response: response,
              fromJson: (data) => ProfileModel.fromJson(data));
          emit(CommunitySuccess(profile));
        },
        emit: emit,
        failureStateBuilder: (message) => CommunityFailure(message));
  }

  String _handleParams(String? search) {
    Map<String, dynamic> params = {};

    if (search != null) {
      params['search'] = search;
    }

    final Uri uri =
        Uri.https(EndPoint.domainName, '/api${EndPoint.community}', params);
    return uri.toString();
  }
}
