

import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/book_details/service/comment_on_book/comment_on_book_states.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';


class CommentOnBookCubit extends BaseCubit<CommentOnBookStates>
{
  CommentOnBookCubit():super(InitialCommentOnBookStates());
  String endPoint =EndPoint.baseUrl+EndPoint.commentOnBook;
  Future commentOnBook (int id , String comment) async
  {
    executeWithCatch(
        action: () async {
          emit(LoadingCommentOnBookStates());
          User? user = DataSource().getUser();
          if (user == null)
          {
            throw Exception(JsonConsts.pleaseLogIn.tr());
          }
          Map<String,dynamic>response =  await Api().fullPost(url: "$endPoint$id",body: {"comment":comment} ,token: user.accessToken);
          emit(SuccessCommentOnBookStates(comment));
        },
        emit: emit,
        failureStateBuilder: (message) => ErrorCommentOnBookStates(message));
  }
}