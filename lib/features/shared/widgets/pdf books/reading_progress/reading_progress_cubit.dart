import 'package:meta/meta.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'reading_progress_state.dart';

class ReadingProgressCubit extends BaseCubit<ReadingProgressState> {
  ReadingProgressCubit() : super(ReadingProgressInitial());
  Future<void> updateProgress({
    required int bookId,
    required int currentPage,
  }) async {
    emit(ReadingProgressLoading());
  
    await executeWithCatch(
      action: () async {
        User user = await requireUser();

        final String endPoint =
            '${EndPoint.baseUrl}${EndPoint.progress}$bookId';

        final Map<String, dynamic> body = {
          "progress": currentPage.toString(),
        };
    
        final Map<String, dynamic> response = await Api().post(
          url: endPoint,
          body: body,
          token: user.accessToken,
        );

        emit(ReadingProgressSuccess(response['message'].toString()));
      },
      emit: emit,
      failureStateBuilder: (message) => ReadingProgressFailure(message),
    );
  }
}
