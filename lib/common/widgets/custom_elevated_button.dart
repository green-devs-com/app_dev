import 'package:app_dev/core/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? buttonWidth;
  final double? buttonHeight;
  final double? fontSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? loadingColor;
  final bool isButton;
  final bool showLoading;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.buttonWidth,
    this.buttonHeight,
    this.fontSize,
    this.backgroundColor,
    this.textColor,
    this.loadingColor,
    this.isButton = true,
    this.showLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight ?? 36,
      width: buttonWidth ?? MediaQuery.of(context).size.width - 80,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          backgroundColor: backgroundColor ?? AppColor.greenDark,
        ),
        onPressed: isButton ? onPressed : null,
        child: showLoading
            ? SpinKitDualRing(
                color: loadingColor ?? Colors.white,
                lineWidth: 2,
                size: 24,
              )
            : Text(
                text,
                style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: fontSize ?? 15,
                ),
              ),
      ),
    );
  }
}
