import 'package:flutter/material.dart';

import '../../../core/utils/base/base_cubit.dart';

class LocaleCubit extends BaseCubit<Locale> 
{
  LocaleCubit(super.initialState); 

  void changeLocale(Locale locale) {
    emit(locale);
  }
}