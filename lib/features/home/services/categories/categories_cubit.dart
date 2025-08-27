import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/features/home/services/categories/categories_states.dart';
import 'package:reading_app/features/shared/data/data_source.dart';
import 'package:reading_app/features/shared/models/category.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/user/user_model.dart';

class CategoriesCubit extends BaseCubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.categories}';

  Future getCategories() async {
    emit(CategoriesLoading());
    try {
      User? user = DataSource().getUser();
      if (user == null) {
        throw Exception(JsonConsts.pleaseLogIn.tr());
      }
      print("categories");
       Map<String, dynamic> response = await Api().get(url: endPoint, token: user.accessToken);

        List<CategoryModel> categories =parseResponse<CategoryModel>(
            response: response,
            fromJson: (data) => CategoryModel.fromJson(data));
        emit(CategoriesSuccess(categories));

      }

     catch (e) {
      emit(CategoriesError(e.toString()));
    }
  }
}
