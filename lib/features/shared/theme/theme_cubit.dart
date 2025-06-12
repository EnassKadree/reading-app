
import '../../../core/utils/base/base_cubit.dart';

enum Themes {light, dark}

class ThemeCubit extends BaseCubit<Themes> 
{
  ThemeCubit(super.initialState);  
  void changeTheme(Themes theme) 
  {
    emit(theme);
  }
}
