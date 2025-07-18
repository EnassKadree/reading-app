import 'package:meta/meta.dart';
import 'package:reading_app/core/network/api.dart';
import 'package:reading_app/core/network/end_point.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import 'package:reading_app/features/shared/models/book.dart';
import 'package:reading_app/features/shared/user/user_model.dart';

part 'favorite_books_state.dart';

class FavoriteBooksCubit extends BaseCubit<FavoriteBooksState> {
  FavoriteBooksCubit() : super(FavoriteBooksInitial());
final String FavoriteBooksEndPoint = '${EndPoint.booksBaseUrl}${EndPoint.favorites}';

  Future<void> getFavoriteBooks() async {
    emit(FavoriteBooksLoading());

    await executeWithCatch(
      action: () async {
        User user = await requireUser();

        Map<String, dynamic> response = await Api().get(
          url: FavoriteBooksEndPoint,
          token: user.accessToken,
        );

        List<BookModel> books = parseResponse<BookModel>(
          response: response,
          fromJson: (data) => BookModel.fromJson(data),
          
        );

        emit(FavoriteBooksSuccess(books));
      },
      emit: emit,
      failureStateBuilder: (message) => FavoriteBooksFailure(message),
    );
  }
}
