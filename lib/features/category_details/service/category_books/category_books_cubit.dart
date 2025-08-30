import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/category_details/service/category_books/category_books_states.dart';
import 'package:reading_app/features/shared/models/book.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

class CategoryBooksCubit extends BaseCubit<CategoryBooksStates> {
  CategoryBooksCubit() : super(CategoryBooksInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.categoryBooks}';

  Future<void> getCategoryBook(int id, {String ? search}) async {
    emit(CategoryBooksLoading());
    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null)
        {
          throw Exception(JsonConsts.pleaseLogIn.tr());
        }
        Map<String, dynamic> response = await Api()
            .get(url: "$endPoint$id", token: user.accessToken,search: search);
        List<BookModel> categoryBooks = parseResponse<BookModel>(
            response: response, fromJson: (data) => BookModel.fromJson(data));
        emit(CategoryBooksSuccess(categoryBooks));
      },
      emit: emit,
      failureStateBuilder: (message) => CategoryBooksError(message),
    );
  }
}
