import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback? onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashFactory: NoSplash.splashFactory,
      highlightColor: const Color(0xffF7F7F7),
      child: SizedBox(
        height: 65,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: 45,
                child: Icon(icon, size: 25, color: context.theme.textColor),
              ),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: context.theme.textColor,
                  ),
                ),
              ),
              if (trailingText != null) ...[
                Text(
                  trailingText!,
                  style: TextStyle(
                    fontSize: 16,
                    color: context.theme.textColor!.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(width: 10),
              ],
              Icon(
                CupertinoIcons.chevron_right,
                size: 18,
                color: context.theme.textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
