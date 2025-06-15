part of 'functions.dart';

extension Localization on  Functions
{
    // void changeLocalization(BuildContext context) 
    // {
    //   LanguageOption selectedLanguage = context.read<LanguageCubit>().state;
    //   Locale newLocale = selectedLanguage == LanguageOption.english ? const Locale('en') : const Locale('ar');
    //   context.read<LocaleCubit>().changeLocale(newLocale);
    // }

    String getFontFamily(Locale locale) 
    {
      if (locale.languageCode == 'ar') 
      {
        return 'cairo';
      } else 
      {
        return 'poppins';
      }
  }

}