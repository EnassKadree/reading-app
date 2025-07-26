import 'package:flutter/material.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'completed_books_state.dart';

class CompletedBooksCubit extends BaseCubit<CompletedBooksState> {
  CompletedBooksCubit() : super(CompletedBooksInitial());
final String completedBooksEndPoint = '${EndPoint.booksBaseUrl}${EndPoint.completed}';

  Future<void> getCompletedBooks() async {
    emit(CompletedBooksLoading());

    await executeWithCatch(
      action: () async {
        User user = await requireUser();

        Map<String, dynamic> response = await Api().get(
          url: completedBooksEndPoint,
          token: user.accessToken,
        );

        List<BookModel> books = parseResponse<BookModel>(
          response: response,
          fromJson: (data) => BookModel.fromJson(data),
          
        );

        emit(CompletedBooksSuccess(books));
      },
      emit: emit,
      failureStateBuilder: (message) =>CompletedBooksFailure(message),
    );
  }
}

