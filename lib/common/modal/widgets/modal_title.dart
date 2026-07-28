import 'package:app_dev/common/widgets/icon_container.dart';
import 'package:app_dev/common/widgets/short_h_bar.dart';
import 'package:flutter/material.dart';

Future<void> modalTitle({
  required BuildContext context,
  required String title,
  required List<Widget> children,
  bool isMax = false,
  bool isDismissible = false,
  bool isScrolled = false,
}) {
  return showModalBottomSheet(
    isDismissible: isDismissible,
    isScrollControlled: isScrolled ? true : false,
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SafeArea(
          bottom: true,
          child: Column(
            mainAxisSize: isMax ? MainAxisSize.max : MainAxisSize.min,
            children: [
              ShortHBar(),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const IconContainer(icon: "x.svg"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              ...children,
            ],
          ),
        ),
      );
    },
  );
}
