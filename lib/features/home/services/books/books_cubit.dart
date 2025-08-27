import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/models/book.dart';
import '../../../shared/user/user_model.dart';
import 'books_states.dart';

class BooksCubit extends BaseCubit<BooksStates> {
  BooksCubit() : super(BooksInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.mostRatedBooks}';

  Future getBooks() async {
    executeWithCatch(
        action: () async {
          emit(BooksLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          print('books');
          Map<String, dynamic> response =
              await Api().getWithToken(url: endPoint, token: user.accessToken);
          List<BookModel> mostRatedBooks = parseResponse<BookModel>(
              response: response, fromJson: (data) => BookModel.fromJson(data));
           emit(BooksSuccess(mostRatedBooks));
        },
        emit: emit,
        failureStateBuilder: (message) => BooksError(message));
  }
}
