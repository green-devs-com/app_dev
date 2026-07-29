import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class CustomUserTile extends StatelessWidget {
  final VoidCallback? onTap;
  final String title;
  final double? titleSize;
  final String? subtitle;
  final double? subtitleSize;
  final String? trailing;
  final double? trailingSize;
  final Color? color;
  final bool isBold;

  const CustomUserTile({
    super.key,
    this.onTap,
    required this.title,
    this.titleSize,
    this.subtitle,
    this.subtitleSize,
    this.trailing,
    this.trailingSize,
    this.color,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      onTap: onTap,
      title: Text(
        title,
        maxLines: 2,
        style: TextStyle(
          color: color ?? context.theme.textColor,
          fontWeight: isBold ? FontWeight.w600 : null,
          fontSize: titleSize ?? 15,
        ),
      ),
      subtitle: subText(context, subtitle != null),
      trailing: trailText(context, trailing != null),
    );
  }

  Widget? subText(BuildContext context, bool condition) {
    Widget? widget;
    if (condition) {
      widget = Text(
        subtitle!,
        style: TextStyle(
          color: context.theme.iconColor,
          fontWeight: FontWeight.w500,
          fontSize: subtitleSize ?? 15,
        ),
      );
    }
    return widget;
  }

  Widget? trailText(BuildContext context, bool condition) {
    Widget? widget;
    if (condition) {
      widget = Text(
        trailing!,
        style: TextStyle(color: Colors.blue, fontSize: trailingSize ?? 15),
      );
    }
    return widget;
  }
}
