part of 'functions.dart';

extension ShowSettingsDialog on Functions {
  Future<dynamic> showSettingsDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return TweenAnimationBuilder<double>(
            duration: const Duration(milliseconds: 300),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.scale(
                scale: Curves.linear.transform(value),
                child: Opacity(
                  opacity: value.clamp(0.0, 1.0),
                  child: Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    alignment: AlignmentDirectional.topEnd,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeOutBack,
                      width: 50.w,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                            spreadRadius: 5,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.bounceOut,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 800),
                                  curve: Curves.elasticOut,
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: context.colorScheme.primary
                                        .withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    Iconsax.setting_2,
                                    color: context.colorScheme.primary,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  JsonConsts.settings.t(context),
                                  style: StylesConsts.f16W600Black.copyWith(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const Divider(height: 1),

                          _buildAnimatedListTile(
                            context: context,
                            index: 0,
                            child: ListTile(
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
                                    inactiveThumbColor:
                                        context.colorScheme.surface,
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
                                      DataSource().saveTheme(
                                          newTheme == Themes.light
                                              ? 'light'
                                              : 'dark');
                                    },
                                  );
                                },
                              ),
                            ),
                          ),

                          _buildAnimatedListTile(
                            context: context,
                            index: 1,
                            child: BlocBuilder<LocaleCubit, Locale>(
                              builder: (context, locale) {
                                bool isEnglish = locale == const Locale('en');
                                return ListTile(
                                  title: Text(
                                    JsonConsts.language.t(context),
                                    style: StylesConsts.f14W600Black,
                                  ),
                                  subtitle: Text(
                                      JsonConsts.currentLanguage.t(context)),
                                  leading: const Icon(
                                    Iconsax.translate,
                                    size: 22,
                                  ),
                                  onTap: () async {
                                    Locale newLocale = isEnglish
                                        ? const Locale('ar')
                                        : const Locale('en');
                                    context
                                        .read<LocaleCubit>()
                                        .changeLocale(newLocale);
                                    DataSource().saveLocale(newLocale);
                                  },
                                );
                              },
                            ),
                          ),

                          _buildAnimatedListTile(
                            context: context,
                            index: 2,
                            child: ListTile(
                              title: Text(
                                JsonConsts.notifications.t(context),
                                style: StylesConsts.f14W600Black,
                              ),
                              leading: const Icon(
                                Iconsax.notification,
                                size: 22,
                              ),
                              onTap: () {
                                context
                                    .push(const NotificationsScreenWrapper());
                              },
                            ),
                          ),

                          _buildAnimatedListTile(
                            context: context,
                            index: 3,
                            child: ListTile(
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
                          ),

                          const Divider(height: 1),

                          _buildAnimatedListTile(
                            context: context,
                            index: 4,
                            child: ListTile(
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  Widget _buildAnimatedListTile({
    required BuildContext context,
    required int index,
    required Widget child,
  }) {
    return TweenAnimationBuilder<double>(
      duration: Duration(milliseconds: 400 + (index * 100)),
      tween: Tween(begin: 0.0, end: 1.0),
      curve: Curves.linear,
      builder: (context, value, child) {
        // Clamp the value to ensure it's within valid range
        final clampedValue = value.clamp(0.0, 1.0);

        return Transform.translate(
          offset: Offset(0, 20 * (1 - clampedValue)),
          child: Opacity(
            opacity: clampedValue,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
              ),
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
