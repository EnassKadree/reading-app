import 'package:easy_localization/easy_localization.dart';
import 'package:reading_app/features/book_details/service/add_to_read/add_to_read_states.dart';
import '../../../../core/network/api.dart';
import '../../../../core/network/end_point.dart';
import '../../../../core/utils/base/base_cubit.dart';
import '../../../../core/utils/constants/json_consts.dart';
import '../../../shared/data/data_source.dart';
import '../../../shared/user/user_model.dart';

class AddToReadCubit extends BaseCubit<AddToReadStates> {
  AddToReadCubit() : super(InitialAddToReadState());
  final String addToRead = '${EndPoint.baseUrl}${EndPoint.addToRead}';
  Future<void> addBookToRead(int id) async {
     emit(LoadingAddToReadState());
    await executeWithCatch(
       action: () async {
         User? user = DataSource().getUser();
        if (user == null) {
          throw Exception(JsonConsts.pleaseLogIn.tr());
         }
        await Api().get(
            url: "$addToRead$id", token: user.accessToken);

         emit(SuccessAddToReadState());
       },
       emit: emit,
       failureStateBuilder: (message) => ErrorAddToReadState(message),
     );
   }


}
