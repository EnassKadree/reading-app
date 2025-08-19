import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/user/user_model.dart';

part 'complaints_state.dart';

class ComplaintsCubit extends BaseCubit<ComplaintsState> {
  ComplaintsCubit() : super(ComplaintsInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.complaints}';
  final TextEditingController subject = TextEditingController();
  final TextEditingController description = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    emit(ComplaintsLoading());
    await executeWithCatch(
        action: () async {
          User user = await requireUser();
          Map<String, dynamic> body = {
            'title': subject.text,
            'author_name': description.text,
          };
          Map<String, dynamic> response =
              await Api().post(url: endPoint, body: body, token: user.accessToken);
          emit(ComplaintsSuccess(response['message']));
        },
        emit: emit,
        failureStateBuilder: (message) => ComplaintsFailure(message));
  }
}
