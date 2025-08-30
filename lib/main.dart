import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:reading_app/core/utils/base/local_notifications_service.dart';
import 'package:reading_app/core/utils/base/push_notifications_service.dart';
import 'package:reading_app/firebase_options.dart';

import 'package:reading_app/features/splash_screen/splash_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'features/book_details/service/comment_on_book/comment_on_book_cubit.dart';
import 'features/shared/data/data_source.dart';
import 'features/shared/localization/app_localization.dart';
import 'features/shared/localization/locale_cubit.dart';
import 'features/shared/theme/theme.dart';
import 'features/shared/theme/theme_cubit.dart';
import 'features/shared/user/user_cubit.dart';
import 'features/shared/user/user_model.dart';
import 'features/shared/widgets/book_card/favorite_bloc/book_favorite_cubit.dart';

late SharedPreferences prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Future.wait([
    PushNotificationsService.init(),
    LocalNotificationService.init(),
  ]);

  prefs = await SharedPreferences.getInstance();

  final User? user = DataSource().getUser();
  final String? savedTheme = DataSource().getTheme();
  final String? savedLocale = DataSource().getLocale();
  final userCubit = UserCubit();

  if (user != null) {
    userCubit.login(user);
  }

  final locale = savedLocale != null ? Locale(savedLocale) : const Locale('en');
  final theme = savedTheme == 'dark' ? Themes.dark : Themes.light;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocaleCubit(locale),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(theme),
        ),
        BlocProvider(create: (context) => userCubit),
        BlocProvider(
          create: (BuildContext context) {
            return BookFavoriteCubit();
          },
        ),
        BlocProvider(
          create: (BuildContext context) {
            return CommentOnBookCubit();
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(402, 874),
        builder: (context, child) => BlocListener<LocaleCubit, Locale>(
          listener: (context, state) {
            WidgetsBinding.instance.addPostFrameCallback((_) {});
          },
          child: BlocBuilder<ThemeCubit, Themes>(
            builder: (context, theme) {
              return BlocBuilder<LocaleCubit, Locale>(
                builder: (context, locale) {
                  return MaterialApp(
                    navigatorKey: navigatorKey,
                    debugShowCheckedModeBanner: false,
                    theme: AppTheme.lightTheme(context, locale),
                    darkTheme: AppTheme.darkTheme(context, locale),
                    themeMode: theme == Themes.dark
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    localizationsDelegates: const [
                      AppLocalizations.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: const [
                      Locale('en', ''),
                      Locale('ar', ''),
                    ],
                    locale: locale,
                    localeResolutionCallback: (locale, supportedLocales) {
                      if (locale == null) return supportedLocales.first;
                      for (var supportedLocale in supportedLocales) {
                        if (supportedLocale.languageCode ==
                            locale.languageCode) {
                          return supportedLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    home: child,
                  );
                },
              );
            },
          ),
        ),
        child: const SplashScreen());
  }
}
