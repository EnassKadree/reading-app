import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/shared/models/author.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';
import 'authors_states.dart';

class AuthorsCubit extends BaseCubit<AuthorsStates>
{
  AuthorsCubit():super(AuthorsInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.authors}';

  Future  getAuthors()async
  {
    executeWithCatch(action:() async{
      emit(AuthorsLoading());
      User? user = DataSource().getUser();
      if (user == null) {
        throw Exception(JsonConsts.pleaseLogIn.tr());
      }
      Map<String, dynamic> response = await Api().get(url: endPoint, token: user.accessToken);
      List<Author> authors =parseResponse<Author>(
          response: response,
          fromJson: (data) => Author.fromJson(data));
      emit(AuthorsSuccess(authors));

    }, emit: emit,
        failureStateBuilder: (message)=>AuthorsError(message),);

  }
}