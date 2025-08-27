import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/shared/widgets/book_card/favorite_bloc/book_favorite_states.dart';
import '../../../../../core/network/api.dart';
import '../../../../../core/network/end_point.dart';
import '../../../../../core/utils/base/base_cubit.dart';
import '../../../../../core/utils/constants/json_consts.dart';
import '../../../data/data_source.dart';
import '../../../user/user_model.dart';


class BookFavoriteCubit extends BaseCubit<BookFavoriteStates> {
  BookFavoriteCubit({bool isFavourite = false}): super(InitialFavoriteState(isFavourite));

  final String addTOFavoriteEndPoint = '${EndPoint.baseUrl}${EndPoint.addTOFavorite}';
  final String removeFromFavoriteEndPoint = '${EndPoint.baseUrl}${EndPoint.removeFromFavorite}';

  Future<void> addToFavorite(int id) async {
    emit(LoadingFavoriteState(false));
    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null) {
          throw Exception(JsonConsts.pleaseLogIn.tr());
        }
        await Api().get(
            url: "$addTOFavoriteEndPoint$id", token: user.accessToken);

        emit(SuccessFavoriteState( true));
      },
      emit: emit,
      failureStateBuilder: (message) => ErrorFavoriteState(message, false),
    );
  }

  Future<void> removeFromFavorite(int id) async {
    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrreeeeeeeeeeeeeeeeeeeeeeemmmmmmmmmmmmmmmmooooooove");
    emit(LoadingFavoriteState( true));
    await executeWithCatch(
      action: () async {
        User? user = DataSource().getUser();
        if (user == null) {
          throw Exception(JsonConsts.pleaseLogIn.tr());
        }
        await Api().fullPost(
            url: "$removeFromFavoriteEndPoint$id", token: user.accessToken);

        emit(SuccessFavoriteState(false));
      },
      emit: emit,
      failureStateBuilder: (message) => ErrorFavoriteState(message, true),
    );
  }
}
