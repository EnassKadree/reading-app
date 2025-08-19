 import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/book_details/service/book_challenge/book_challenge_states.dart';
import 'package:reading_app/features/shared/models/book_challenge.dart';

import '../../../../core/network/api.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

class BookChallengeCubit extends BaseCubit<BookChallengeStates>
{
  BookChallengeCubit():super(BookChallengeInitial());
   String endPoint =EndPoint.baseUrl+EndPoint.bookChallenge;
  Future getBookChallenge (int id ) async
  {
    executeWithCatch(
        action: () async {
          emit(BookChallengeLoading());
          User? user = DataSource().getUser();
          if (user == null)
          {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          Map<String, dynamic> response =
          await Api().getWithToken(url: "$endPoint$id", token: user.accessToken);
          BookChallenge  bookChallenge = BookChallenge.fromJson(response);
          emit(BookChallengeSuccess(bookChallenge));
        },
        emit: emit,
        failureStateBuilder: (message) => BookChallengeError(message));
  }
}