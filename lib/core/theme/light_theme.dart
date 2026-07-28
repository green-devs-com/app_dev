import 'package:app_dev/core/theme/app_color.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: ThemeData.light().textTheme.apply(fontFamily: "Pretendard"),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: "Pretendard",
    ),
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    colorScheme: ColorScheme.fromSwatch(
      backgroundColor: AppColor.backgroundLight,
    ),
    scaffoldBackgroundColor: AppColor.backgroundLight,
    extensions: [CustomTheme.lightMode],
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.backgroundLight,
      foregroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      toolbarHeight: 50,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        color: AppColor.textLight,
        fontWeight: FontWeight.bold,
        fontSize: 17,
      ),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(color: AppColor.backgroundDark, size: 22),
      actionsIconTheme: CupertinoIconThemeData(),
    ),
    tabBarTheme: const TabBarThemeData(dividerColor: Colors.transparent),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.greenLight;
        }
        return AppColor.greyLight;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: AppColor.textLight, width: 0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColor.greenDark;
        }
        return Colors.transparent;
      }),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.backgroundLight,
        disabledBackgroundColor: const Color(0xFFF2F2F2),
        disabledForegroundColor: AppColor.backgroundLight,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: AppColor.greenDark),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColor.greenLight,
        shadowColor: Colors.transparent,
        elevation: 0,
      ),
    ),
    dialogTheme: DialogThemeData(
      shadowColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.backgroundLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.backgroundLight,
      modalBackgroundColor: AppColor.backgroundLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
    cupertinoOverrideTheme: const CupertinoThemeData(
      brightness: Brightness.light,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,
      backgroundColor: AppColor.backgroundLight,
      selectedItemColor: AppColor.greenDark,
      unselectedItemColor: AppColor.textLight.withValues(alpha: 0.4),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
