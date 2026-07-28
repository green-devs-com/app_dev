import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomOutlineTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final bool? readOnly;
  final FocusNode? focusNode;
  final TextAlign? textAlign;
  final TextInputType? keyboardType;
  final Widget? prefix;
  final Widget? suffix;
  final String? prefixText;
  final Widget? suffixIcon;
  final bool? autoFocus;
  final bool? obscureText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLength;
  final int? maxLines;
  final String? labelText;
  final Color? labelColor;
  final String? hintText;
  final Color? hintColor;
  final bool? showCounter;
  final String? counterText;
  final Color? counterColor;
  final Icon? icon;
  final EdgeInsetsGeometry? contentPadding;

  const CustomOutlineTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.onTap,
    this.readOnly,
    this.focusNode,
    this.textAlign,
    this.keyboardType,
    this.prefixText,
    this.prefix,
    this.suffix,
    this.suffixIcon,
    this.icon,
    this.autoFocus,
    this.obscureText,
    this.fontSize,
    this.fontWeight,
    this.maxLength,
    this.maxLines,
    this.labelText,
    this.labelColor,
    this.hintText,
    this.hintColor,
    this.showCounter = true,
    this.counterText,
    this.counterColor,
    this.contentPadding,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTap: onTap,
      controller: controller,
      readOnly: readOnly ?? false,
      textAlign: textAlign ?? TextAlign.center,
      keyboardType: readOnly == null ? keyboardType : null,
      onChanged: onChanged,
      style: TextStyle(
        color: context.theme.textColor,
        fontWeight: fontWeight,
        fontSize: fontSize ?? 14,
      ),
      autofocus: autoFocus ?? false,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        contentPadding:
            contentPadding ?? const EdgeInsets.fromLTRB(13, 12, 40, 12),
        prefixIcon: icon,
        prefixIconColor: context.theme.mainColor,
        isDense: true,
        errorMaxLines: 2,
        prefix: prefix,
        suffix: suffix,
        prefixText: prefixText,
        suffixIcon: suffixIcon,
        labelText: labelText,
        floatingLabelStyle: TextStyle(
          color: labelColor ?? context.theme.textColor,
          fontSize: 18,
        ),
        labelStyle: TextStyle(
          color: labelColor ?? context.theme.iconColor,
          fontSize: 13,
        ),
        filled: true,
        fillColor: context.theme.fieldColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? context.theme.iconColor,
          fontWeight: fontWeight,
          fontSize: fontSize ?? 14,
        ),
        counterText: showCounter! ? counterText : "",
        counterStyle: TextStyle(
          color: counterColor ?? context.theme.iconColor,
          fontSize: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: context.theme.subColor!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: context.theme.mainColor!),
        ),
      ),
    );
  }
}
