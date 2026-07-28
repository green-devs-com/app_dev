import 'package:app_dev/core/theme/app_color.dart';
import 'package:flutter/material.dart';

extension Extended on BuildContext {
  CustomTheme get theme => Theme.of(this).extension<CustomTheme>()!;
}

class CustomTheme extends ThemeExtension<CustomTheme> {
  static const lightMode = CustomTheme(
    mainColor: AppColor.greenDark,
    greyColor: AppColor.greyLight,
    textColor: AppColor.textLight,
    textReversed: AppColor.textDark,
    fieldColor: Color(0xFFFFFFFF),
    bgColor: Color(0xFFFFFFFF),
    subColor: Color(0xFFF2F2F2),
    iconColor: AppColor.greyLight,
    btnColor: Colors.white,
  );

  static const darkMode = CustomTheme(
    mainColor: AppColor.greenLight,
    greyColor: AppColor.greyDark,
    textColor: AppColor.textDark,
    textReversed: AppColor.textLight,
    fieldColor: Color(0xFF181818),
    bgColor: Color(0xFF111111),
    subColor: Color(0xFF181818),
    iconColor: Color(0xffbfbfbf),
    btnColor: Color(0xFF2D2D2D),
  );

  final Color? mainColor;
  final Color? greyColor;
  final Color? textColor;
  final Color? textReversed;
  final Color? fieldColor;
  final Color? bgColor;
  final Color? subColor;
  final Color? iconColor;
  final Color? btnColor;

  const CustomTheme({
    this.mainColor,
    this.greyColor,
    this.textColor,
    this.textReversed,
    this.fieldColor,
    this.bgColor,
    this.subColor,
    this.iconColor,
    this.btnColor,
  });

  @override
  ThemeExtension<CustomTheme> copyWith({
    Color? mainColor,
    Color? greyColor,
    Color? textColor,
    Color? textReversed,
    Color? fieldColor,
    Color? bgColor,
    Color? subColor,
    Color? iconColor,
    Color? btnColor,
  }) {
    return CustomTheme(
      mainColor: mainColor ?? this.mainColor,
      greyColor: greyColor ?? this.greyColor,
      textColor: textColor ?? this.textColor,
      textReversed: textReversed ?? this.textReversed,
      fieldColor: fieldColor ?? this.fieldColor,
      bgColor: bgColor ?? this.bgColor,
      subColor: subColor ?? this.subColor,
      iconColor: iconColor ?? this.iconColor,
      btnColor: btnColor ?? this.btnColor,
    );
  }

  @override
  ThemeExtension<CustomTheme> lerp(
    covariant ThemeExtension<CustomTheme>? other,
    double t,
  ) {
    if (other is! CustomTheme) return this;
    return CustomTheme(
      mainColor: Color.lerp(mainColor, other.mainColor, t),
      greyColor: Color.lerp(greyColor, other.greyColor, t),
      textColor: Color.lerp(textColor, other.textColor, t),
      textReversed: Color.lerp(textReversed, other.textReversed, t),
      fieldColor: Color.lerp(fieldColor, other.fieldColor, t),
      bgColor: Color.lerp(bgColor, other.bgColor, t),
      subColor: Color.lerp(subColor, other.subColor, t),
      iconColor: Color.lerp(iconColor, other.iconColor, t),
      btnColor: Color.lerp(btnColor, other.btnColor, t),
    );
  }
}
