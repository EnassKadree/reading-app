part of 'data_source.dart';

extension ThemeSource on DataSource
{
  void saveTheme(String theme) 
  {
    prefs.setString(DataSource._themeKey, theme); 
  }

  String? getTheme() 
  {
    return prefs.getString(DataSource._themeKey);
  }
}