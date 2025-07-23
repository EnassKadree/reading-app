import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import 'user_challenges_states.dart';

class UserChallengesCubit extends BaseCubit<UserChallengesStates> {

  UserChallengesCubit() : super(UserChallengeInitial());

   final String endPoint = '${EndPoint.baseUrl}${EndPoint.userChallenges}';

  Future getActiveChallenges() async
  {

  }
}
