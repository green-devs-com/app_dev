import 'package:app_dev/common/widgets/icon_container.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatefulWidget {
  final String socialType;
  final VoidCallback onPressed;
  final Color? buttonColor;
  final Color? textColor;

  const SignInButton({
    super.key,
    required this.socialType,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
  });

  @override
  State<SignInButton> createState() => _SignInButtonState();
}

class _SignInButtonState extends State<SignInButton> {
  bool isPressed = false;

  void onTapDown(TapDownDetails details) {
    setState(() => isPressed = true);
  }

  void onTapUp(TapUpDetails details) {
    setState(() => isPressed = false);
    widget.onPressed();
  }

  void onTapCancel() {
    setState(() => isPressed = false);
  }

  Widget showLogo(String type) {
    switch (type) {
      case "Apple":
        return Image.asset("assets/images/apple_logo.png", width: 30);
      case "Google":
        return SizedBox(
          width: 32,
          height: 20,
          child: Image.asset("assets/images/google_logo.png"),
        );
      default:
        return const Padding(
          padding: EdgeInsets.only(right: 6),
          child: IconContainer(color: Colors.white, icon: "mail.svg", size: 20),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final borderColor =
        widget.buttonColor ?? context.theme.textColor!.withValues(alpha: 0.2);
    return GestureDetector(
      onTapDown: onTapDown,
      onTapUp: onTapUp,
      onTapCancel: onTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 35,
        width: isPressed ? width - 100 : width - 80,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? Colors.white,
          border: Border.all(color: borderColor, width: 0.8),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showLogo(widget.socialType),
              Text(
                context.locale.languageCode == "ko"
                    ? "${widget.socialType}로 계속하기"
                    : "Continue with ${widget.socialType}",
                style: TextStyle(
                  color: widget.textColor ?? Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
