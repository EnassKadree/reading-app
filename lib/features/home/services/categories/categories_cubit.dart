import 'package:reading_app/core/utils/constants/json_consts.dart';
import 'package:reading_app/features/home/services/categories/categories_states.dart';
import 'package:reading_app/features/shared/data/data_source.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../shared/user/user_model.dart';
class CategoriesCubit extends BaseCubit<CategoriesStates>
{
  CategoriesCubit():super(CategoriesInitial());
  final String endPoint = '${EndPoint.baseUrl}${EndPoint.categories}';

  Future  getCategories()async
  {
   emit(CategoriesLoading());
  executeWithCatch(
      action: () async
      {
       User?user = DataSource().getUser();
       if (user==null) {
         throw Exception(JsonConsts.pleaseLogIn);
       }
       Map<String,dynamic> response =await Api().getWithToken(url: endPoint, token: user.accessToken);
       print(response);
      },
      emit: emit,
      failureStateBuilder:(message)=> CategoriesError(message)
  );

  }
}

