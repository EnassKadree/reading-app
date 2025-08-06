import 'package:flutter/material.dart';

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


  static ThemeData get lightTheme
  {
    // colors
    const primaryColor = ColorsConsts.purple;
    const secondaryColor = ColorsConsts.gold;
    const tertiaryColor=ColorsConsts.pink;
    const scaffoldBackgroundColor = ColorsConsts.white;
    const surfaceContainer = Colors.white;
    const primaryContainer = Color(0xffD5D5D5);
    const secondaryContainer = Color(0xff888888);
    const pink = ColorsConsts.pink;


    // theme light
    return ThemeData(
        fontFamily: "poppins",
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
        ),
        // appbar
        appBarTheme: const AppBarTheme(
          shadowColor: Colors.black,
          backgroundColor: scaffoldBackgroundColor,
          surfaceTintColor: Colors.white,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: "poppins",
          ),
        ),

        //input decoration
        inputDecorationTheme: InputDecorationTheme
          (
          fillColor: pink.withOpacity(.5).withBlue(255),
          filled: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
          hintStyle: TextStyle(color: primaryColor.withOpacity(.7), fontSize: 18),
          floatingLabelStyle: const TextStyle(color: primaryContainer, fontSize: 15),
          suffixIconColor: secondaryContainer,
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(32),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent, width: 0),
            borderRadius: BorderRadius.circular(32),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 1),
            borderRadius: BorderRadius.circular(32),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red[900]!, width: 0),
            borderRadius: BorderRadius.circular(32),
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

        checkboxTheme: const CheckboxThemeData
          (
          shape: RoundedRectangleBorder
            (
            borderRadius: BorderRadius.all(Radius.circular(6)),
            //side: BorderSide(width: .5)
          ),
          side: BorderSide(width: 1,color: Colors.grey),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData
          (
          backgroundColor: primaryColor,
          iconSize: 32,
          shape: CircleBorder(),
        )
    );

  }

  // theme dark
  static ThemeData get darkTheme {
    //colors
    primaryColor = const Color.fromARGB(255, 121, 87, 199);
    secondaryColor = const Color(0xff8B704E).withOpacity(0.1);
    scaffoldBackgroundColor = const Color(0xff101010);
    surfaceContainer = const Color.fromARGB(255, 41, 41, 41);
    primaryContainer = const Color(0xffD5D5D5);
    secondaryContainer = const Color(0xff888888);

    // theme
    return ThemeData(
      fontFamily: "IBM",
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      iconTheme: const IconThemeData(color: Colors.white),
      colorScheme: ColorScheme.dark(
        primary: primaryColor,
        secondary: secondaryColor,
        surfaceContainer: surfaceContainer,
        brightness: Brightness.dark,
        secondaryContainer: secondaryContainer,
        primaryContainer: primaryContainer,
      ),

      //input decoration
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(color: secondaryContainer, fontSize: 15),
        floatingLabelStyle: TextStyle(color: primaryContainer, fontSize: 15),
        suffixIconColor: surfaceContainer,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryContainer, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryContainer, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColor, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryContainer, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: "IBM",
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white70),
        titleLarge: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}