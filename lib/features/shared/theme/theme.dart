import 'package:flutter/material.dart';
import 'package:reading_app/core/utils/constants/fonts_consts.dart';

import '../../../core/utils/constants/colors_consts.dart';

class AppTheme {
  //variables
  static late Color primaryColor;
  static late Color secondaryColor;
  static late Color scaffoldBackgroundColor;
  static late Color surfaceContainer;
  static late Color secondaryContainer;
  static late Color primaryContainer;
  static late Color tertiaryColor;

  static ThemeData lightTheme(BuildContext context, Locale locale) {
    final isArabic = locale.languageCode == 'ar';
    final fontFamily = isArabic ? FontsConsts.cairo : FontsConsts.poppins;
    // colors
    const primaryColor = ColorsConsts.purple;
    const secondaryColor = ColorsConsts.gold;
    const tertiaryColor = ColorsConsts.pink;
    scaffoldBackgroundColor = Colors.grey[50]!;
    const surfaceContainer = Colors.white;
    const primaryContainer = Color(0xffD5D5D5);
    const secondaryContainer = Color(0xff888888);
    //const pink = ColorsConsts.pink;

    // theme light
    return ThemeData(
        fontFamily: fontFamily,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        iconTheme: const IconThemeData(size: 28, color: primaryColor),
        // color system
        colorScheme: const ColorScheme.light(
            primary: primaryColor,
            tertiary: tertiaryColor,
            secondary: secondaryColor,
            surfaceContainer: surfaceContainer,
            brightness: Brightness.light,
            secondaryContainer: secondaryContainer,
            primaryContainer: primaryContainer,
            onPrimary: Colors.black),
        // appbar
        appBarTheme: AppBarTheme(
          shadowColor: Colors.black,
          backgroundColor: scaffoldBackgroundColor,
          surfaceTintColor: Colors.white,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: fontFamily,
          ),
        ),

        //input decoration
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          hintStyle:
          TextStyle(color: primaryColor.withOpacity(.7), fontSize: 14),
          floatingLabelStyle:
          const TextStyle(color: primaryContainer, fontSize: 15),
          suffixIconColor: secondaryContainer,
          disabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide:
            BorderSide(color: Colors.grey.withOpacity(.5), width: 2),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: primaryColor,
              width: 2,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.red[900]!, width: 0),
          ),
        ),

        //elevation ElevatedButton
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(100, 40),
            backgroundColor: Colors.white.withOpacity(0.4),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        checkboxTheme: const CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            //side: BorderSide(width: .5)
          ),
          side: BorderSide(width: 1, color: Colors.grey),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          iconSize: 32,
          shape: CircleBorder(),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            backgroundColor: surfaceContainer,
            elevation: 10,
            unselectedItemColor: primaryColor.withAlpha(100),
            selectedItemColor: primaryColor,
            selectedIconTheme: const IconThemeData(size: 22),
            unselectedIconTheme: const IconThemeData(size: 22),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed),
        dividerTheme: DividerThemeData(
          color: secondaryColor.withOpacity(.2),
          thickness: 1,
          space: 15,
        ),
        tabBarTheme: TabBarThemeData(
          indicator: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          indicatorColor: Colors.transparent,
          dividerColor: Colors.transparent,
          labelPadding: EdgeInsets.zero,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: surfaceContainer,
          unselectedLabelStyle:
          TextStyle(fontWeight: FontWeight.normal, fontFamily: fontFamily),
        ));
  }

  // theme dark
  static ThemeData darkTheme(BuildContext context, Locale locale) {
    final isArabic = locale.languageCode == 'ar';
    final fontFamily = isArabic ? FontsConsts.cairo : FontsConsts.poppins;

    // colors - maintaining same structure but with dark variants
    const primaryColor = ColorsConsts.purple;
    const secondaryColor = ColorsConsts.gold;
    const tertiaryColor = ColorsConsts.pink;
    scaffoldBackgroundColor =
    const Color(0xFF121212); // Material Design dark background
    const surfaceContainer = Color(0xFF1E1E1E); // Dark surface color
    const primaryContainer = Color(0xFF2D2D2D); // Dark primary container
    const secondaryContainer = Color(0xFF4A4A4A); // Dark secondary container

    // theme dark
    return ThemeData(
      fontFamily: fontFamily,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      iconTheme: const IconThemeData(size: 28, color: primaryColor),
      // color system
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        tertiary: tertiaryColor,
        secondary: secondaryColor,
        surfaceContainer: surfaceContainer,
        brightness: Brightness.dark,
        secondaryContainer: secondaryContainer,
        primaryContainer: primaryContainer,
        // Additional dark theme colors
        surface: surfaceContainer,
        onSurface: Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onTertiary: Colors.white,
      ),
      // appbar
      appBarTheme: AppBarTheme(
        shadowColor: Colors.black,
        backgroundColor: scaffoldBackgroundColor,
        surfaceTintColor: surfaceContainer,
        centerTitle: false,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: fontFamily,
        ),
      ),

      //input decoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        hintStyle: TextStyle(color: primaryColor.withOpacity(.7), fontSize: 14),
        floatingLabelStyle:
        const TextStyle(color: primaryContainer, fontSize: 15),
        suffixIconColor: secondaryContainer,
        disabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(.5), width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red[400]!, width: 0),
        ),
      ),

      //elevation ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(100, 40),
          backgroundColor: surfaceContainer.withOpacity(0.4),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(Colors.white),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(6)),
        ),
        side: const BorderSide(width: 1, color: Colors.grey),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
        iconSize: 32,
        shape: CircleBorder(),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          backgroundColor: surfaceContainer,
          elevation: 10,
          unselectedItemColor: primaryColor.withAlpha(100),
          selectedItemColor: primaryColor,
          selectedIconTheme: const IconThemeData(size: 22),
          unselectedIconTheme: const IconThemeData(size: 22),
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed),
      dividerTheme: DividerThemeData(
        color: Colors.grey[600],
        thickness: 1,
        space: 15,
      ),
      tabBarTheme: TabBarThemeData(
        indicator: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        indicatorColor: Colors.transparent,
        dividerColor: Colors.transparent,
        labelPadding: EdgeInsets.zero,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: surfaceContainer,
        unselectedLabelStyle:
        TextStyle(fontWeight: FontWeight.normal, fontFamily: fontFamily),
      ),

      // Additional dark theme specific styles
      cardTheme: CardThemeData(
        color: surfaceContainer,
        elevation: 4,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Dialog theme for dark mode
      dialogTheme: DialogThemeData(
        backgroundColor: surfaceContainer,
        elevation: 8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      // List tile theme for dark mode
      listTileTheme: const ListTileThemeData(
        textColor: Colors.white,
        iconColor: primaryColor,
        tileColor: Colors.transparent,
      ),

      // Switch theme for dark mode
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return Colors.grey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor.withOpacity(0.5);
          }
          return Colors.grey.withOpacity(0.5);
        }),
      ),

      // Text theme for dark mode
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          color: Colors.grey[400],
          fontFamily: fontFamily,
        ),
        titleLarge: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        titleMedium: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
      ),

      // Popup menu theme for dark mode
      popupMenuTheme: PopupMenuThemeData(
        color: surfaceContainer,
        elevation: 8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // Bottom sheet theme for dark mode
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: surfaceContainer,
        elevation: 8,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
      ),

      // Chip theme for dark mode
      chipTheme: ChipThemeData(
        backgroundColor: primaryContainer,
        selectedColor: primaryColor,
        disabledColor: Colors.grey.withOpacity(0.3),
        labelStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),

      // Expansion tile theme for dark mode
      expansionTileTheme: const ExpansionTileThemeData(
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        textColor: Colors.white,
        iconColor: primaryColor,
        collapsedTextColor: Colors.white,
        collapsedIconColor: primaryColor,
      ),

      // Data table theme for dark mode
      dataTableTheme: DataTableThemeData(
        headingTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
          fontWeight: FontWeight.bold,
        ),
        dataTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
      ),

      // Tooltip theme for dark mode
      tooltipTheme: TooltipThemeData(
        textStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Snackbar theme for dark mode
      snackBarTheme: SnackBarThemeData(
        backgroundColor: surfaceContainer,
        contentTextStyle: TextStyle(
          color: Colors.white,
          fontFamily: fontFamily,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      // Progress indicator theme for dark mode
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryColor,
        linearTrackColor: primaryContainer,
        circularTrackColor: primaryContainer,
      ),

      // Slider theme for dark mode
      sliderTheme: SliderThemeData(
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryContainer,
        thumbColor: primaryColor,
        overlayColor: primaryColor.withOpacity(0.2),
      ),

      // Radio theme for dark mode
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return primaryColor;
          }
          return Colors.grey;
        }),
      ),

      // Drawer theme for dark mode
      drawerTheme: const DrawerThemeData(
        backgroundColor: surfaceContainer,
        elevation: 8,
        shadowColor: Colors.black,
      ),

      // Badge theme for dark mode
      badgeTheme: const BadgeThemeData(
        backgroundColor: primaryColor,
        textColor: Colors.white,
        largeSize: 20,
        smallSize: 16,
      ),

      // Primary color
      primaryColor: primaryColor,

      // Primary color light
      primaryColorLight: primaryColor.withOpacity(0.7),

      // Primary color dark
      primaryColorDark: primaryColor.withOpacity(0.9),

      // Focus color
      focusColor: primaryColor.withOpacity(0.2),

      // Hover color
      hoverColor: primaryColor.withOpacity(0.1),

      // Splash color
      splashColor: primaryColor.withOpacity(0.2),

      // Highlight color
      highlightColor: primaryColor.withOpacity(0.1),

      // Unselected widget color
      unselectedWidgetColor: Colors.grey[400],

      // Disabled color
      disabledColor: Colors.grey[600],

      // Secondary header color
      secondaryHeaderColor: primaryContainer,

      // Hint color
      hintColor: Colors.grey[400],

      // Shadow color
      shadowColor: Colors.black,

      // Use material 3
      useMaterial3: true,
    );
  }
}
