import 'package:app_dev/common/modal/language_modal.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguageButton extends ConsumerWidget {
  const LanguageButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String languageStatus(BuildContext context) {
      if (context.locale.toString() == "ko") {
        return "한국어";
      } else if (context.locale.toString() == "ja") {
        return "日本語";
      } else if (context.locale.toString() == "ru") {
        return "ру́сский";
      } else {
        return "English";
      }
    }

    return Material(
      color: context.theme.subColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () => languageModal(context: context, isRefresh: false),
        borderRadius: BorderRadius.circular(20),
        splashFactory: NoSplash.splashFactory,
        highlightColor: context.theme.bgColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.language, color: context.theme.mainColor, size: 22),
              const SizedBox(width: 5),
              Text(
                languageStatus(context),
                style: TextStyle(color: context.theme.mainColor, fontSize: 13),
              ),
              const SizedBox(width: 5),
              Icon(
                CupertinoIcons.chevron_down,
                color: context.theme.mainColor,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
