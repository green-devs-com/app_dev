import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconContainer extends StatelessWidget {
  final String icon;
  final Color? color;
  final double? size;

  const IconContainer({super.key, required this.icon, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/$icon",
      colorFilter: ColorFilter.mode(
        color ?? context.theme.textColor!,
        BlendMode.srcIn,
      ),
      width: size ?? 22,
      height: size ?? 22,
    );
  }
}
