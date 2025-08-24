

import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/book_details/service/rate_the_book/rate_the_book_states.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';


class RateTheBookCubit extends BaseCubit<RateState>
{
  RateTheBookCubit():super(InitialRateState());
  String endPoint =EndPoint.baseUrl+EndPoint.rateTheBook;
  Future rateTheBook (int id , double rate) async
  {
    executeWithCatch(
        action: () async {
          emit(LoadingRateState());
          User? user = DataSource().getUser();
          if (user == null)
          {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          Map<String,dynamic>response =  await Api().fullPost(url: "$endPoint$id",body: {"rate":rate.round().toString()} ,token: user.accessToken);
            emit(SuccessRateState());
        },
        emit: emit,
        failureStateBuilder: (message) => ErrorRateState(message));
  }
}