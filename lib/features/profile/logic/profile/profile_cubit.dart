import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/features/shared/models/profile_model.dart';

import '../../../../core/network/api.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

part 'profile_state.dart';

class ProfileCubit extends BaseCubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.profile}';

  Future getProfile({String? userId}) async {
    executeWithCatch(
        action: () async {
          emit(ProfileLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          Map<String, dynamic> response =
              await Api().getWithToken(url: endPoint, token: user.accessToken);
          ProfileModel profile = ProfileModel.fromJson(response['data']);
          emit(ProfileSuccess(profile));
        },
        emit: emit,
        failureStateBuilder: (message) => ProfileFailure(message));
  }
}
