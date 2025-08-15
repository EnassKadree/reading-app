part of 'functions.dart';

extension ShowSettingsDialog on Functions {
  Future<dynamic> showSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              alignment: AlignmentDirectional.topEnd,
              child: Container(
                width: 50.w,
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        JsonConsts.darkMode.t(context),
                        style: StylesConsts.f14W600Black,
                      ),
                      leading: const Icon(
                        Iconsax.moon,
                        size: 22,
                      ),
                      trailing: BlocBuilder<ThemeCubit, Themes>(
                        builder: (context, theme) {
                          bool isDark = theme == Themes.dark;
                          return Switch(
                              padding: EdgeInsets.zero,
                              activeColor: context.colorScheme.secondary,
                              inactiveThumbColor: context.colorScheme.surface,
                              activeTrackColor:
                                  ColorsConsts.splashBackgroundColor,
                              inactiveTrackColor: Colors.grey[300]!,
                              value: isDark,
                              onChanged: (value) async {
                                Themes newTheme =
                                    isDark ? Themes.light : Themes.dark;
                                context
                                    .read<ThemeCubit>()
                                    .changeTheme(newTheme);
                                DataSource().saveTheme(newTheme == Themes.light
                                    ? 'light'
                                    : 'dark');
                              });
                        },
                      ),
                    ),
                    BlocBuilder<LocaleCubit, Locale>(
                      builder: (context, locale) {
                        bool isEnglish = locale == const Locale('en');
                        return ListTile(
                          title: Text(
                            JsonConsts.language.t(context),
                            style: StylesConsts.f14W600Black,
                          ),
                          subtitle: Text(JsonConsts.currentLanguage.t(context)),
                          leading: const Icon(
                            Iconsax.translate,
                            size: 22,
                          ),
                          onTap: () async {
                            Locale newLocale = isEnglish
                                ? const Locale('ar')
                                : const Locale('en');
                            context.read<LocaleCubit>().changeLocale(newLocale);
                            DataSource().saveLocale(newLocale);
                          },
                        );
                      },
                    ),
                    ListTile(
                      title: Text(
                        JsonConsts.connectWithAdmins.t(context),
                        style: StylesConsts.f14W600Black,
                      ),
                      leading: const Icon(
                        Iconsax.message,
                        size: 22,
                      ),
                      onTap: () {
                        context.push(const ComplaintsScreenWrapper());
                      },
                    ),
                    ListTile(
                      title: Text(
                        JsonConsts.logout.t(context),
                        style: StylesConsts.f14W600Black
                            .copyWith(color: Colors.red[800]!),
                      ),
                      leading: Icon(
                        Iconsax.logout,
                        color: Colors.red[800],
                        size: 22,
                      ),
                      onTap: () {
                        context.read<UserCubit>().logout();
                        context.pushAndRemoveAll(const LoginPage());
                      },
                    ),
                  ],
                ),
              ));
        });
  }
}
