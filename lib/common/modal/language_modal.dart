import 'package:app_dev/common/dialog/custom_snackbar.dart';
import 'package:app_dev/common/dialog/loading_dialog.dart';
import 'package:app_dev/common/modal/widgets/modal_title.dart';
import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> languageModal({
  required BuildContext context,
  required bool isRefresh,
}) {
  return modalTitle(
    context: context,
    title: "언어 설정",
    children: [
      RadioGroup<String>(
        groupValue: context.locale.languageCode,
        onChanged: (String? langCode) async {
          if (langCode == null) return;

          late String message;

          switch (langCode) {
            case 'ko':
              message = "변경이 완료되었습니다.";
              break;
            case 'ja':
              message = "変更が完了しました。";
              break;
            case 'ru':
              message = "Настройки успешно обновлены.";
              break;
            default:
              message = "Language has been updated successfully.";
              break;
          }

          Navigator.pop(context);

          await loadingDialog(context: context, message: "변경 사항 저장 중...");

          await Future.delayed(const Duration(seconds: 1));

          if (!context.mounted) return;

          await context.setLocale(Locale(langCode));

          if (!context.mounted) return;

          Navigator.pop(context);

          if (isRefresh) {
            Navigator.pushReplacementNamed(context, Routes.setting);
          }

          customSnackBar(context: context, text: message);
        },
        child: Column(
          children: [
            selectLanguage(context, 'en'),
            selectLanguage(context, 'ko'),
            selectLanguage(context, 'ja'),
            selectLanguage(context, 'ru'),
          ],
        ),
      ),
    ],
  );
}

RadioListTile<String> selectLanguage(BuildContext context, String langCode) {
  late String title;
  late String subtitle;

  switch (langCode) {
    case 'ko':
      title = "한국어";
      subtitle = "Korean";
      break;

    case 'ja':
      title = "日本語";
      subtitle = "Japanese";
      break;

    case 'ru':
      title = "Русский";
      subtitle = "Russian";
      break;

    default:
      title = "English";
      subtitle = "US";
      break;
  }

  return RadioListTile<String>(
    dense: true,
    value: langCode,
    title: Text(
      title,
      style: TextStyle(color: context.theme.textColor, fontSize: 14),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(color: context.theme.iconColor, fontSize: 13),
    ),
  );
}
