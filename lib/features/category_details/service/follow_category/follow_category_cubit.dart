import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/category_details/service/follow_category/follow_category_states.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

class FollowUnFollowCategoryCubit extends BaseCubit<FollowUnFollowCategoryStates> {
  FollowUnFollowCategoryCubit({bool isFollowed = false})
      : super(FollowUnFollowCategoryInitial(isFollowed));

  final String followEndPoint = '${EndPoint.baseUrl}${EndPoint.followCategory}';
  final String unFollowEndPoint = '${EndPoint.baseUrl}${EndPoint.unFollowCategory}';

  Future<void> followCategory(int id) async {
    emit(FollowUnFollowCategoryLoading(false));
    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null) {
          throw Exception(JsonConsts.pleaseLogIn.tr());
        }
       await Api().fullPost(
            url: "$followEndPoint$id", token: user.accessToken);

        emit(FollowUnFollowCategorySuccess( true));
      },
      emit: emit,
      failureStateBuilder: (message) => FollowUnFollowCategoryError(message, false),
    );
  }

  Future<void> unFollowCategory(int id) async {
    emit(FollowUnFollowCategoryLoading( true));
    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null) {
          throw Exception(JsonConsts.pleaseLogIn.tr());
        }
     await Api().delete(
            url: "$unFollowEndPoint$id", token: user.accessToken);

        emit(FollowUnFollowCategorySuccess(false));
      },
      emit: emit,
      failureStateBuilder: (message) => FollowUnFollowCategoryError(message, true),
    );
  }
}
