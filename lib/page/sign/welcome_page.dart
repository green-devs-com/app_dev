import 'dart:developer';
import 'dart:io';
import 'package:app_dev/common/widgets/custom_elevated_button.dart';
import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/sign/widgets/privacy_terms_text.dart';
import 'package:app_dev/page/sign/widgets/sign_in_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  late bool isAgree;
  // 애플 계정 로그인
  void signInWithApple(BuildContext context) async {
    log("signInWithApple");
    // ref.read(signController).signInWithApple(context: context);
  }

  // 구글 계정 로그인
  void signInWithGoogle(BuildContext context) async {
    log("signInWithGoogle");
    Navigator.pushNamedAndRemoveUntil(
      context,
      Routes.identification,
      (route) => false,
    );
    // ref.read(signController).signInWithGoogle(context: context);
  }

  @override
  void initState() {
    isAgree = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/app_logo_icon.png",
                      color: context.theme.mainColor,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // const LanguageButton(),
                  const SizedBox(height: 25),
                  isAgree
                      ? Column(
                          children: [
                            if (Platform.isIOS)
                              SignInButton(
                                socialType: "Apple",
                                onPressed: () => signInWithApple(context),
                              )
                            else
                              SignInButton(
                                socialType: "Google",
                                onPressed: () => signInWithGoogle(context),
                              ),
                            const SizedBox(height: 10),
                            Text(
                              "최초 로그인 시 계정을 생성해야 합니다.",
                              style: TextStyle(
                                color: context.theme.iconColor,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 30),
                          ],
                        )
                      : Column(
                          children: [
                            CustomElevatedButton(
                              buttonHeight: 34,
                              onPressed: () => setState(() => isAgree = true),
                              text: "동의 및 계속하기",
                            ),
                            PrivacyTermsText(),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
