import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Future<void> loadingContainer({
  required BuildContext context,
  String? message,
  bool? showMessage = true,
  Color? loadingColor,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return PopScope(
        canPop: false,
        child: showMessage == true
            ? AlertDialog(
                contentPadding: const EdgeInsets.symmetric(vertical: 20),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SpinKitDualRing(
                          color: context.theme.mainColor!,
                          lineWidth: 1.5,
                          size: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          message!,
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: context.theme.textColor,
                            fontSize: 15,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : SpinKitDualRing(
                color: loadingColor ?? Colors.white,
                lineWidth: 3,
                size: 50,
              ),
      );
    },
  );
}
