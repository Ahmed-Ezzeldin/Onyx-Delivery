import 'package:flutter/material.dart';
import 'package:onyx_delivery/services/theme/app_colors.dart';

class AppTheme {
  static const String _fontFamily = "Montserrat";
  static ThemeData lightTheme = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    dialogBackgroundColor: Colors.white,
    indicatorColor: AppColors.primaryColor,
    focusColor: AppColors.primaryColor,
    cardColor: Colors.white,
    dividerColor: Colors.grey,
    hintColor: Colors.grey,
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.accentColor,
      brightness: Brightness.light,
      background: Colors.white,
      error: Colors.redAccent,
    ),
    canvasColor: Colors.white,
    drawerTheme: DrawerThemeData(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
      surfaceTintColor: Colors.transparent,
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        color: Colors.white,
        fontFamily: _fontFamily,
      ),
    ),
    dividerTheme: const DividerThemeData(color: Colors.grey, thickness: 1),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accentColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: AppColors.primaryColor,
      backgroundColor: AppColors.snackBarDarkBackground,
      contentTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        fontFamily: _fontFamily,
      ),
    ),
    dialogTheme: DialogTheme(
      elevation: 5,
      backgroundColor: Colors.white,
      iconColor: AppColors.primaryColor,
      shadowColor: Colors.black87,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
      displaySmall: TextStyle(color: Colors.black),
      displayLarge: TextStyle(color: Colors.black),
      displayMedium: TextStyle(color: Colors.black),
      headlineLarge: TextStyle(color: Colors.black),
      headlineSmall: TextStyle(color: Colors.black),
      headlineMedium: TextStyle(color: Colors.black),
      labelLarge: TextStyle(color: Colors.black),
      labelMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
      titleLarge: TextStyle(color: Colors.black),
      titleMedium: TextStyle(color: Colors.black),
      titleSmall: TextStyle(color: Colors.black),
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: AppColors.primaryColor,
      textColor: Colors.black,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontFamily: _fontFamily,
        ),
      ),
    ),
    sliderTheme: const SliderThemeData(
      thumbColor: AppColors.primaryColor,
      valueIndicatorColor: Colors.black87,
      activeTrackColor: AppColors.primaryColor,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
      selectionColor: Colors.blue,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(
        color: Colors.black,
        fontFamily: _fontFamily,
      ),
      hintStyle: TextStyle(
        color: Colors.grey,
        fontFamily: _fontFamily,
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.solid, color: Colors.grey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(style: BorderStyle.solid, color: AppColors.primaryColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        textStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.primaryColor,
          fontFamily: _fontFamily,
        ),
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.primaryColor,
    ),
    primaryIconTheme: const IconThemeData(
      color: Colors.black,
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      trackColor: MaterialStateProperty.all<Color>(AppColors.primaryColor.withOpacity(0.5)),
      overlayColor: MaterialStateProperty.all<Color>(AppColors.primaryColor.withOpacity(0.2)),
      trackOutlineColor: MaterialStateProperty.all<Color>(Colors.grey.withOpacity(0.5)),
      splashRadius: 0.0,
      trackOutlineWidth: MaterialStateProperty.all<double>(2),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(Colors.white),
      overlayColor: MaterialStateProperty.all<Color>(AppColors.primaryColor.withOpacity(0.2)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
      side: MaterialStateBorderSide.resolveWith(
        (states) => const BorderSide(width: 1.5, color: AppColors.primaryColor),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all<Color>(AppColors.primaryColor),
      overlayColor: MaterialStateProperty.all<Color>(AppColors.primaryColor.withOpacity(0.2)),
    ),
  );
}
