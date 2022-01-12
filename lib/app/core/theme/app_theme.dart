import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app/core/values/app_colors.dart';

class AppTheme {
  static final ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
    ),
  );

  static final TextButtonThemeData _secondaryButtonDarkThemeData = TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));
  static final TextButtonThemeData _secondaryButtonLightThemeData = TextButtonThemeData(style: TextButton.styleFrom(primary: AppColors.primaryColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))));

  static final OutlinedButtonThemeData _outlinedButtonDarkThemeData = OutlinedButtonThemeData(style: OutlinedButton.styleFrom(primary: Colors.white, side: const BorderSide(color: Colors.white, width: 2), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))));

  static final OutlinedButtonThemeData _outlinedButtonLightThemeData = OutlinedButtonThemeData(style: OutlinedButton.styleFrom(primary: AppColors.primaryColor, side: const BorderSide(color: AppColors.primaryColor, width: 2), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))));
  static TextTheme _textTheme(Color textColor) => TextTheme(
        headline1: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 26,
          fontWeight: FontWeight.w400,
        ),
        headline2: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 25,
          fontWeight: FontWeight.w400,
        ),
        headline3: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 22,
          fontWeight: FontWeight.w400,
        ),
        headline4: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
        headline5: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        headline6: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        subtitle1: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 10.5,
          fontWeight: FontWeight.normal,
        ),
        subtitle2: GoogleFonts.montserrat(
          color: textColor.withOpacity(0.5),
          fontSize: 10.5,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        bodyText2: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
        button: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 13,
          fontWeight: FontWeight.w600,
          wordSpacing: 1.5,
        ),
        caption: GoogleFonts.montserrat(
          color: textColor,
          fontSize: 14,
        ),
        overline: GoogleFonts.montserrat(
          color: textColor,
        ),
      );
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.lightBackgroundColor,
      iconTheme: const IconThemeData(color: AppColors.darkBackgroundColor),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.lightTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 1.5,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    textButtonTheme: _secondaryButtonLightThemeData,
    outlinedButtonTheme: _outlinedButtonLightThemeData,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    backgroundColor: AppColors.lightBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.lightTextColor,
      unselectedItemColor: AppColors.lightTextColor.withOpacity(AppColors.disabledTextOpacity),
      selectedIconTheme: const IconThemeData(color: AppColors.lightTextColor, opacity: 1),
      unselectedIconTheme: const IconThemeData(color: AppColors.lightTextColor, opacity: AppColors.disabledIconOpacity),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.lightTextColor,
      unselectedLabelColor: AppColors.lightTextColor.withOpacity(AppColors.disabledTextOpacity),
      labelPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 12.0),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.0, color: AppColors.lightTextColor),
      ),
    ),
    textTheme: _textTheme(AppColors.lightTextColor),
    iconTheme: const IconThemeData(color: AppColors.lightTextColor),
    scaffoldBackgroundColor: AppColors.lightDeepBackgroundColor,
    dividerColor: AppColors.lightTextColor.withOpacity(AppColors.disabledTextOpacity),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primaryColor,
    ),
    appBarTheme: AppBarTheme(
      color: AppColors.darkBackgroundColor,
      iconTheme: const IconThemeData(color: AppColors.lightBackgroundColor),
      titleTextStyle: GoogleFonts.montserrat(
        color: AppColors.darkTextColor,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      elevation: 1.5,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData,
    textButtonTheme: _secondaryButtonDarkThemeData,
    outlinedButtonTheme: _outlinedButtonDarkThemeData,
    primaryColor: AppColors.primaryColor,
    primaryColorDark: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    backgroundColor: AppColors.darkBackgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackgroundColor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedItemColor: AppColors.darkTextColor,
      unselectedItemColor: AppColors.darkTextColor.withOpacity(AppColors.disabledTextOpacity),
      selectedIconTheme: const IconThemeData(color: AppColors.darkTextColor, opacity: 1),
      unselectedIconTheme: const IconThemeData(color: AppColors.darkTextColor, opacity: AppColors.disabledIconOpacity),
      selectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontSize: 10,
        fontWeight: FontWeight.normal,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.white,
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.darkTextColor,
      unselectedLabelColor: AppColors.darkTextColor.withOpacity(AppColors.disabledTextOpacity),
      labelPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 12.0),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(width: 2.0, color: AppColors.darkTextColor),
      ),
    ),
    textTheme: _textTheme(AppColors.darkTextColor),
    iconTheme: const IconThemeData(color: AppColors.darkTextColor),
    scaffoldBackgroundColor: AppColors.darkDeepBackgroundColor,
    dividerColor: AppColors.darkTextColor.withOpacity(AppColors.disabledTextOpacity),
  );
  static ThemeData currentTheme = (Get.isDarkMode ? darkTheme : lightTheme);
}
