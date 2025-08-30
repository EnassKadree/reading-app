import 'package:easy_localization/easy_localization.dart';
import 'package:meta/meta.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

part 'notifications_count_state.dart';

class NotificationsCountCubit extends BaseCubit<NotificationsCountState> {
  NotificationsCountCubit() : super(NotificationsCountInitial());
    final String endPoint = '${EndPoint.baseUrl}${EndPoint.notificationsCount}';

  Future get() async {
    executeWithCatch(
        action: () async {
          emit(NotificationsCountLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }

          Map<String, dynamic> response =
              await Api().getWithToken(url: endPoint, token: user.accessToken);
          int count =
              response['count'];
          print('---------------------------------------------');
          print(response.toString());
          emit(NotificationsCountSuccess(count));
        },
        emit: emit,
        failureStateBuilder: (message) => NotificationsCountFailure(message));
  }
}
