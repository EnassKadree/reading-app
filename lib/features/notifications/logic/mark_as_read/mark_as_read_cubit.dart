import 'package:meta/meta.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';

import '../../../../core/network/api.dart';
import '../../../shared/user/user_model.dart';

part 'mark_as_read_state.dart';

class MarkAsReadCubit extends BaseCubit<MarkAsReadState> {
  MarkAsReadCubit() : super(MarkAsReadInitial());

  final String markReadEndPoint = '${EndPoint.baseUrl}${EndPoint.markRead}';
  final String markAllReadEndPoint = '${EndPoint.baseUrl}${EndPoint.markAllRead}';

  Future<void> mark(String notificationId) async {
    emit(MarkAsReadLoading());
    await executeWithCatch(
        action: () async {
          User user = await requireUser();
          Map<String, dynamic> response = await Api().post(
              url: '$markReadEndPoint$notificationId',
              token: user.accessToken,
              body: null);
          emit(MarkAsReadSuccess(response['message']));
          print('---------------------------success');
          print(response);
        },
        emit: emit,
        failureStateBuilder: (message) => MarkAsReadFailure(message));
  }
  Future<void> markAll() async {
    emit(MarkAsReadLoading());
    await executeWithCatch(
        action: () async {
          User user = await requireUser();
          Map<String, dynamic> response = await Api().post(
              url: '$markAllReadEndPoint',
              token: user.accessToken,
              body: null);
          emit(MarkAsReadSuccess(response['message']));
          print('---------------------------success');
          print(response);
        },
        emit: emit,
        failureStateBuilder: (message) => MarkAsReadFailure(message));
  }
}
