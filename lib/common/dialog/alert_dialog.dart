import 'package:app_dev/common/widgets/custom_elevated_button.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

dynamic alertDialog({
  required BuildContext context,
  required String message,
  VoidCallback? onPressed,
  String? btnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: context.theme.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        actionsPadding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          CustomElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              onPressed;
            },
            text: btnText ?? tr("done"),
            buttonWidth: 130,
          ),
        ],
      );
    },
  );
}
