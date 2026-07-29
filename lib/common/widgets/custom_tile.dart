import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final double? titleSize;
  final String? subtitle;
  final double? subtitleSize;
  final Widget? subWidget;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? titleColor;
  final bool showTrailing;
  final bool isBold;

  const CustomTile({
    super.key,
    this.onTap,
    required this.title,
    this.titleSize,
    this.subtitle,
    this.subtitleSize,
    this.subWidget,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.titleColor,
    this.showTrailing = true,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      minLeadingWidth: 0,
      leading: icon != null
          ? Icon(icon, color: context.theme.textColor, size: iconSize ?? 26)
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? context.theme.textColor,
          fontWeight: isBold ? FontWeight.w600 : null,
          fontSize: titleSize ?? 14,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle.toString(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.theme.textColor!.withValues(alpha: 0.7),
                fontWeight: FontWeight.w500,
                fontSize: subtitleSize ?? 14,
              ),
            )
          : subtitle == null && subWidget != null
          ? subWidget
          : null,
      trailing: showTrailing
          ? Icon(
              CupertinoIcons.chevron_forward,
              color: context.theme.iconColor,
              size: 20,
            )
          : null,
    );
  }
}
