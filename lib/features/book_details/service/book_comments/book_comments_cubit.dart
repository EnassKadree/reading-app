import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/book_details/service/book_comments/book_comments_states.dart';

import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/models/comment.dart';
import '../../../shared/user/user_model.dart';


class BookCommentsCubit extends BaseCubit<BookCommentsStates>
{
  BookCommentsCubit():super(InitialBookCommentsStates());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.bookComments}';

  Future  getBookComments( int id)async
  {
    executeWithCatch(action:() async{
      emit(LoadingBookCommentsStates());
      User? user = DataSource().getUser();
      if (user == null) {
        throw Exception(JsonConsts.pleaseLogIn.tr());
      }
      Map<String, dynamic> response = await Api().get(url:"$endPoint$id", token: user.accessToken);
      print(response);
      List<Comment> comments =parseResponse<Comment>(
          response: response,
          fromJson: (comments) => Comment.fromJson(comments));
      emit(SuccessBookCommentsStates(comments));

    }, emit: emit,
      failureStateBuilder: (message)=>ErrorBookCommentsStates(message),);

  }
}