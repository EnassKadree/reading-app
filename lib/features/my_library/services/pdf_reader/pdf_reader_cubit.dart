import 'package:flutter_bloc/flutter_bloc.dart';

class PdfReaderCubit extends Cubit<int> {
  PdfReaderCubit(super.initialPage);

  void updatePage(int page) => emit(page);
}
