import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

import '../../../../core/network/api.dart';
import '../../../../core/utils/base/base_cubit.dart';

part 'suggestion_state.dart';

class SuggestionCubit extends BaseCubit<SuggestionState> {
  SuggestionCubit() : super(SuggestionInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.suggestions}';
  final TextEditingController title = TextEditingController();
  final TextEditingController authorName = TextEditingController();
  final TextEditingController note = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> submit() async {
    emit(SuggestionLoading());
    await executeWithCatch(
        action: () async {
          User user = await requireUser();
          Map<String, dynamic> body = {
            'title': title.text,
            'author_name': authorName.text,
            'note': note.text,
          };
          Map<String, dynamic> response =
              await Api().post(url: endPoint, body: body, token: user.accessToken);
          emit(SuggestionSuccess(response['message']));
        },
        emit: emit,
        failureStateBuilder: (message) => SuggestionFailure(message));
  }
}
