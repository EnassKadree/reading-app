import 'package:meta/meta.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'to_read_state.dart';

class ToReadCubit extends BaseCubit<ToReadState> {
  ToReadCubit() : super(ToReadInitial());
  final String inReadEndPoint = '${EndPoint.booksBaseUrl}${EndPoint.toRead}';

  Future<void> getToReadBooks() async {
    emit(ToReadLoading());

    await executeWithCatch(
      action: () async {
        User user = await requireUser();

        Map<String, dynamic> response = await Api().get(
          url: inReadEndPoint,
          token: user.accessToken,
        );

        List<BookModel> books = parseResponse<BookModel>(
          response: response,
          fromJson: (data) => BookModel.fromJson(data),
          
        );

        emit(ToReadSuccess(books));
      },
      emit: emit,
      failureStateBuilder: (message) => ToReadFailure(message),
    );
  }


}
