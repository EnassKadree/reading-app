

import 'package:easy_localization/easy_localization.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';
import 'join_book_challenge_states.dart';

class JoinBookChallengeCubit extends BaseCubit<JoinBookChallengeStates>
{
  JoinBookChallengeCubit():super(JoinBookChallengeInitial());
  String endPoint =EndPoint.baseUrl+EndPoint.joinBookChallenge;
  Future joinBookChallenge (int id ) async
  {
    executeWithCatch(
        action: () async {
          emit(JoinBookChallengeLoading());
          User? user = DataSource().getUser();
          if (user == null)
          {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          Map<String, dynamic> response = await Api().getWithToken(url: "$endPoint$id", token: user.accessToken);
          print(response);
          emit(JoinBookChallengeSuccess());
        },
        emit: emit,
        failureStateBuilder: (message) => JoinBookChallengeError(message));
  }
}