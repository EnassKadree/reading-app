import 'package:flutter/material.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/user/user_model.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
part 'in_read_state.dart';

class InReadCubit extends BaseCubit<InReadState> {
  InReadCubit() : super(InReadInitial());
final String toReadEndPoint = '${EndPoint.booksBaseUrl}${EndPoint.inRead}';

  Future<void> getInReadBooks() async {
    emit(InReadLoading());

    await executeWithCatch(
      action: () async {
        User user = await requireUser();

        Map<String, dynamic> response = await Api().get(
          url: toReadEndPoint,
          token: user.accessToken,
        );

        List<BookModel> books = parseResponse<BookModel>(
          response: response,
          fromJson: (data) => BookModel.fromJson(data),
          
        );

        emit(InReadSuccess(books));
      },
      emit: emit,
      failureStateBuilder: (message) => InReadFailure(message),
    );
  }
}
