import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import 'app_colors.dart';
import 'app_sizes.dart';

class AppTheme {
  const AppTheme._();

  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primary600,
    disabledColor: AppColors.gray600,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Inter",
    highlightColor: AppColors.gray400,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: AppColors.white,
    dialogTheme: const DialogTheme(backgroundColor: Colors.red),
    tabBarTheme: const TabBarTheme(tabAlignment: TabAlignment.start),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(Colors.blue),
      fillColor: MaterialStateProperty.all(Colors.white),
    ),
    // colorScheme: const ColorScheme(
    //   primary: AppColors.primary600,
    //   onPrimary: Colors.white,
    //   secondary: AppColors.warning600,
    //   onSecondary: Colors.black,
    //   error: AppColors.error600,
    //   onError: Colors.white,
    //   background: Colors.white,
    //   onBackground: Colors.black,
    //   brightness: Brightness.light,
    //   surface: AppColors.gray600,
    //   onSurface: Colors.black,
    // ),

    // inputDecorationTheme: InputDecorationTheme(
    //   contentPadding: const EdgeInsets.symmetric(horizontal: AppSizes.layoutMargin, vertical: AppSizes.layoutMargin),
    //   border:
    //       OutlineInputBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius), borderSide: BorderSide(color: AppTheme.lightPrimaryColor, width: 1.0)),
    //   disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(AppSizes.borderRadius)),
    //   enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(AppSizes.borderRadius), borderSide: BorderSide(color: AppTheme.lightDisabledColor, width: 1.0)),
    //   errorBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(AppSizes.borderRadius),
    //     borderSide: BorderSide(color: AppTheme.lightErrorColor, width: 2.0),
    //   ),
    //   focusedBorder: OutlineInputBorder(
    //     borderRadius: BorderRadius.circular(AppSizes.borderRadius),
    //     borderSide: BorderSide(color: AppTheme.lightPrimaryColor, width: 2.0),
    //   ),
    //   labelStyle: const TextStyle(color: AppColors.gray, fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w400),
    // ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 48, fontWeight: FontWeight.w500),
      displayMedium: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 36, fontWeight: FontWeight.w600),
      displaySmall: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 24, fontWeight: FontWeight.w600),
      titleLarge: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.w600),
      titleMedium: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w600),
      titleSmall: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w600),
      bodyLarge: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.w500),
      bodyMedium: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w500),
      bodySmall: TextStyle(color: AppColors.gray900, fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w500),
      labelLarge: TextStyle(color: AppColors.gray500, fontFamily: "Inter", fontSize: 18, fontWeight: FontWeight.w400),
      labelMedium: TextStyle(color: AppColors.gray500, fontFamily: "Inter", fontSize: 16, fontWeight: FontWeight.w400),
      labelSmall: TextStyle(color: AppColors.gray500, fontFamily: "Inter", fontSize: 14, fontWeight: FontWeight.w400),
    ),
  );

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: themeMode == ThemeMode.light ? Colors.deepPurpleAccent : Colors.red,
      statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light ? AppColors.white : AppColors.black,
      systemNavigationBarDividerColor: Colors.transparent,
    ));
  }

  static PinTheme passwordPinTheme = PinTheme(
    width: 10,
    height: 10,
    margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 16),
    padding: const EdgeInsets.all(16),
    textStyle: const TextStyle(fontSize: 1, color: AppColors.primary700, fontWeight: FontWeight.w500),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      color: AppColors.primary200,
    ),
  );

  static PinTheme defaultPinTheme = PinTheme(
    width: 64,
    height: 64,
    textStyle: const TextStyle(fontSize: 40, color: AppColors.primary700, fontWeight: FontWeight.w500),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      color: Colors.white,
      border: Border.all(color: AppColors.gray300, width: 1),
    ),
  );

  static PinTheme defaultSmallPinTheme = PinTheme(
    width: 48,
    height: 48,
    textStyle: const TextStyle(fontSize: 24, color: AppColors.primary700, fontWeight: FontWeight.w500),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius),
      color: Colors.white,
      border: Border.all(color: AppColors.gray300, width: 1),
    ),
  );
}
