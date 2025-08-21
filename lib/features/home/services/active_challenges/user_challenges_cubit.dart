import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/shared/models/user_challenge.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';
import 'user_challenges_states.dart';

class UserChallengesCubit extends BaseCubit<UserChallengesStates> {

  UserChallengesCubit() : super(UserChallengeInitial());

   final String endPoint = '${EndPoint.baseUrl}${EndPoint.userChallenges}';

  Future getActiveChallenges() async
  {
    executeWithCatch(action:() async{
      emit(UserChallengeLoading());
      User? user = DataSource().getUser();
      if (user == null) {
        throw Exception(JsonConsts.pleaseLogIn.tr());
      }
      print(user.accessToken);
      Map<String, dynamic> response = await Api().get(url: endPoint, token: user.accessToken);
      List<UserChallenge> userChallenges =parseResponse<UserChallenge>(
          response: response,
          fromJson: (data) => UserChallenge.fromJson(data));

      emit(UserChallengeSuccess(userChallenges));

    }, emit: emit,
      failureStateBuilder: (message)=>UserChallengeError(message),);

  }
}
