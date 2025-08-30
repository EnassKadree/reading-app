import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/notification_response_model.dart';

import '../../../../core/network/end_point.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

part 'all_notifications_state.dart';

class AllNotificationsCubit extends BaseCubit<AllNotificationsState> {
  AllNotificationsCubit() : super(AllNotificationsInitial());

  final String endPoint = '${EndPoint.baseUrl}${EndPoint.allNotifications}';

  Future get() async {
    executeWithCatch(
        action: () async {
          emit(AllNotificationsLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }

          Map<String, dynamic> response =
              await Api().getWithToken(url: endPoint, token: user.accessToken);
          NotificationsResponse notifications =
              NotificationsResponse.fromJson(response);
          print('---------------------------------------------');
          print(response.toString());
          emit(AllNotificationsSuccess(notifications));
        },
        emit: emit,
        failureStateBuilder: (message) => AllNotificationsFailure(message));
  }
}
