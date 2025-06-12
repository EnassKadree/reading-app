import '../../../core/utils/base/base_cubit.dart';
import '../data/data_source.dart';
import 'user_model.dart';

class UserCubit extends BaseCubit<User?> 
{
  UserCubit() : super(null);

  void login(User user) 
  {
    DataSource().saveUser(user);
    emit(user);
  }

  void logout() 
  {
    DataSource().clearUser();
    emit(null);
  }
}
