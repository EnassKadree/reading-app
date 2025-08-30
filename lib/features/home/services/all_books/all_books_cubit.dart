import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/core/utils/base/base_cubit.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/models/book.dart';
import '../../../shared/user/user_model.dart';
import 'all_books_states.dart';


class AllBooksCubit extends BaseCubit<AllBooksStates> {
  AllBooksCubit() : super(AllBooksInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.getAllBooks}';

  Future getAllBooks({String? search}) async {
    executeWithCatch(
        action: () async {
          emit(AllBooksLoading());
          User? user = DataSource().getUser();
          if (user == null) {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          Map<String, dynamic> response =
          await Api().get(url: endPoint, token: user.accessToken,search: search);
          List<BookModel> mostRatedBooks = parseResponse<BookModel>(
              response: response, fromJson: (data) => BookModel.fromJson(data));
          emit(AllBooksSuccess(mostRatedBooks));
        },
        emit: emit,
        failureStateBuilder: (message) => AllBooksError(message));
  }
}
