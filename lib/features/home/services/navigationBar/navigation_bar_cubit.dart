import '../../../../core/utils/base/base_cubit.dart';

class BottomNavCubit extends BaseCubit<int> {
  BottomNavCubit({required this.init}) : super(init);
  int init;

  void updateTab(int index) {
    emit(index);
  }
}
