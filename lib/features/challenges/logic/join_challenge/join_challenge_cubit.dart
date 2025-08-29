import 'package:meta/meta.dart';
import 'package:reading_app/core/network/end_point.dart';

import '../../../../core/network/api.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/user/user_model.dart';

part 'join_challenge_state.dart';

class JoinChallengeCubit extends BaseCubit<JoinChallengeState> {
  JoinChallengeCubit() : super(JoinChallengeInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.joinChallenge}';

  Future<void> join(int challengeId) async {
    emit(JoinChallengeLoading());
    await executeWithCatch(
        action: () async {
          User user = await requireUser();
          Map<String, dynamic> response = await Api().post(
              url: '$endPoint$challengeId',
              token: user.accessToken,
              body: null);
          emit(JoinChallengeSuccess(response['message'], challengeId));
          print('---------------------------success');
          print(response);
        },
        emit: emit,
        failureStateBuilder: (message) => JoinChallengeFailure(message));
  }
}
