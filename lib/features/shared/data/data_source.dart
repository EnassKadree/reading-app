import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../main.dart';
import '../user/user_model.dart';


part 'locale_source.dart';
part 'user_source.dart';
part 'theme_source.dart';

class DataSource 
{
  static const String _userKey = 'user';
  static const String _themeKey = 'theme';
  static const String _localeKey = 'locale';
  
  static void clearAll()
  {
    prefs.clear();
  }
}
