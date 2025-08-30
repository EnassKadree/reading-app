import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/network/api.dart';
import '../../../../../core/network/end_point.dart';
import '../../../../../core/utils/base/base_cubit.dart';
import '../../../../../core/utils/constants/json_consts.dart';
import '../../../data/data_source.dart';
import '../../../user/user_model.dart';
import 'book_favorite_states.dart';


class BookFavoriteCubit extends BaseCubit<BookFavoriteStates> {
  BookFavoriteCubit() : super(BookFavoriteStates.initial());

  final String addTOFavoriteEndPoint = '${EndPoint.baseUrl}${EndPoint.addTOFavorite}';
  final String removeFromFavoriteEndPoint = '${EndPoint.baseUrl}${EndPoint.removeFromFavorite}';


  Future<void> toggleFavorite(int bookId) async {
    // الحالة الحالية: إذا موجودة استخدمها، إذا لا اعتبر false
    bool currentState = state.favorites[bookId] ?? false;

    emit(LoadingFavoriteState(bookId, currentState));

    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null) throw Exception(JsonConsts.pleaseLogIn.tr());

        if (!currentState) {
          await Api().get(url: "$addTOFavoriteEndPoint$bookId", token: user.accessToken);
        } else {
          await Api().fullPost(url: "$removeFromFavoriteEndPoint$bookId", token: user.accessToken);
        }

        // تحديث فقط الكتاب المحدد
        final newFavorites = Map<int, bool>.from(state.favorites);
        newFavorites[bookId] = !currentState;

        emit(BookFavoriteStates(newFavorites));
      },
      emit: emit,
      failureStateBuilder: (message) => ErrorFavoriteState(bookId, message, currentState),
    );
  }

}