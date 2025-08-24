import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/library_stats.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'library_stats_state.dart';

class LibraryStatsCubit extends BaseCubit<LibraryStatsState> {
  LibraryStatsCubit() : super(LibraryStatsInitial());

  final String statsEndpoint = '${EndPoint.baseUrl}${EndPoint.bookInfo}';

  Future<void> getLibraryStats() async {
    emit(LibraryStatsLoading());

    await executeWithCatch(
      action: () async {
        User user = await requireUser();

        final Map<String, dynamic> response = await Api().get(
          url: statsEndpoint,
          token: user.accessToken,
        );

        final stats = LibraryStats.fromJson(response);

        emit(LibraryStatsSuccess(stats));
      },
      emit: emit,
      failureStateBuilder: (message) => LibraryStatsFailure(message),
    );
  }
}
