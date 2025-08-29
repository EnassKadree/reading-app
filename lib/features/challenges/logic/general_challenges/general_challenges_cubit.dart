import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/features/shared/models/challenge_model.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

import '../../../shared/data/data_source.dart';

part 'general_challenges_state.dart';

class GeneralChallengesCubit extends BaseCubit<GeneralChallengesState> {
  GeneralChallengesCubit() : super(GeneralChallengesInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.generalChallenges}';

  Future get() async {
    executeWithCatch(
        action: () async {
          emit(GeneralChallengesLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }

          Map<String, dynamic> response =
              await Api().getWithToken(url: endPoint, token: user.accessToken);
          List<ChallengeModel> challenges = parseResponse<ChallengeModel>(
              response: response,
              fromJson: (data) => ChallengeModel.fromJson(data));
          emit(GeneralChallengesSuccess(challenges: challenges));
        },
        emit: emit,
        failureStateBuilder: (message) => GeneralChallengesFailure(message));
  }
}
