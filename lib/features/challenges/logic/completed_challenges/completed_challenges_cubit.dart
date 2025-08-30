import 'package:easy_localization/easy_localization.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/models/challenge_model.dart';
import '../../../shared/user/user_model.dart';

part 'completed_challenges_state.dart';

class CompletedChallengesCubit extends BaseCubit<CompletedChallengesState> {
  CompletedChallengesCubit() : super(CompletedChallengesInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.completedChallenges}';

  Future get() async {
    executeWithCatch(
        action: () async {
          emit(CompletedChallengesLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }

          Map<String, dynamic> response =
          await Api().getWithToken(url: endPoint, token: user.accessToken);
          List<ChallengeModel> challenges = parseResponse<ChallengeModel>(
              response: response,
              fromJson: (data) => ChallengeModel.fromJson(data));
          emit(CompletedChallengesSuccess(challenges: challenges));
        },
        emit: emit,
        failureStateBuilder: (message) => CompletedChallengesFailure(message));
  }
}