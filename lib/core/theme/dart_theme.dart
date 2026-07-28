import 'package:app_dev/core/theme/app_color.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: ThemeData.dark().textTheme.apply(fontFamily: "Pretendard"),
    primaryTextTheme: ThemeData.dark().textTheme.apply(
      fontFamily: "Pretendard",
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppColor.backgroundDark,
    ),
    scaffoldBackgroundColor: AppColor.backgroundDark,
    extensions: [CustomTheme.darkMode],
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundDark,
      foregroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 50,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.textDark,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      iconTheme: IconThemeData(color: Colors.white, size: 22),
    ),
    tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.white;
        }
        return AppColor.greyDark;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: AppColor.textDark, width: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.greenLight;
        }
        return Colors.transparent;
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.backgroundDark,
        disabledBackgroundColor: const Color(0xFF202020),
        disabledForegroundColor: AppColor.backgroundLight,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    dialogTheme: DialogThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.backgroundDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.backgroundDark,
      modalBackgroundColor: AppColor.backgroundDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.dark,
    ),
  );
}
