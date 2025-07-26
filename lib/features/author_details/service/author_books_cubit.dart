
import 'package:easy_localization/easy_localization.dart';

import '../../../../core/utils/base/base_cubit.dart';
import '../../../core/network/api.dart';
import '../../../core/network/end_point.dart';
import '../../../core/utils/constants/json_consts.dart';
import '../../shared/data/data_source.dart';
import '../../shared/models/book.dart';
import '../../shared/user/user_model.dart';
import 'author_books_states.dart';

class AuthorBooksCubit extends BaseCubit<AuthorBooksStates>
{
  AuthorBooksCubit():super(AuthorBooksInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.categoryBooks}';

  Future  getAuthorBooks( int id)async
  {
    emit(AuthorBooksLoading());
    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null)
        {
          throw Exception(JsonConsts.pleaseLogIn.tr());
        }
        Map<String, dynamic> response = await Api()
            .getWithToken(url: "$endPoint$id", token: user.accessToken);
        List<BookModel> authorsBooks = parseResponse<BookModel>(
            response: response, fromJson: (data) => BookModel.fromJson(data));
        emit(AuthorBooksSuccess(authorsBooks));
      },
      emit: emit,
      failureStateBuilder: (message) => AuthorBooksError(message),
    );
  }
}