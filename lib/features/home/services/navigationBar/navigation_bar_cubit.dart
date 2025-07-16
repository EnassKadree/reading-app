import '../../../../core/utils/base/base_cubit.dart';

class BottomNavCubit extends BaseCubit<int> {
  BottomNavCubit({this.init = 0}) : super(init);
  int init;

  void updateTab(int index) {
    emit(index);
  }
}
