// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/book_pdf.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'book_pdf_state.dart';

class BookPdfCubit extends BaseCubit<BookPdfState> {
  BookPdfCubit() : super(BookPdfInitial());

  Future<void> getBookPdf(int bookId) async {
    emit(BookPdfLoading());

    await executeWithCatch(
      action: () async {
        User user = await requireUser();
        final String url = '${EndPoint.baseUrl}${EndPoint.bookPdf}$bookId';

        final Map<String, dynamic> response = await Api().get(
          url: url,
          token: user.accessToken,
        );

        final BookPdfModel bookPdf = BookPdfModel.fromJson(response,bookId);
        emit(BookPdfSuccess(bookPdf));
      },
      emit: emit,
      failureStateBuilder: (message) => BookPdfFailure(message),
    );
  }
}
