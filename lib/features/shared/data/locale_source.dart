part of 'data_source.dart';

extension LocaleSource on DataSource
{
  void saveLocale(Locale locale) 
  {
    prefs.setString(DataSource._localeKey, locale.toString()); 
  }

  String? getLocale() 
  {
    return prefs.getString(DataSource._localeKey); 
  }
}
