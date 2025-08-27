import 'package:flutter_bloc/flutter_bloc.dart';

class SheetCubit extends Cubit<bool> {
  SheetCubit() : super(false);
  void openTheSheet() => emit(true);
  void closeTheSheet() => emit(false);
  void toggle() => emit(!state);
}
