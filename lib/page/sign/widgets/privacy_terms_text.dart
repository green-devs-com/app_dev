import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PrivacyTermsText extends StatelessWidget {
  const PrivacyTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 30),
      child: RichText(
        textScaler: TextScaler.linear(0.9),
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(color: context.theme.iconColor, fontSize: 13),
          children: textSpan(context),
        ),
      ),
    );
  }

  List<InlineSpan> textSpan(BuildContext context) {
    return [
      TextSpan(
        children: [
          TextSpan(
            text: "개인정보처리방침",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: "과 "),
          TextSpan(
            text: "이용약관",
            style: const TextStyle(color: Colors.blue),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
      const TextSpan(text: "을 확인해주세요."),
      TextSpan(text: "\n\"${"동의 및 계속하기"}\" 를 누르면 서비스에 동의하게 됩니다."),
    ];
  }
}
