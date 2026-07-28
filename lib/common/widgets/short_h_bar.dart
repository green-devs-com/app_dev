import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';

class ShortHBar extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;

  const ShortHBar({super.key, this.height, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: height ?? 6,
        width: width ?? 80,
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: color ?? context.theme.greyColor!.withValues(alpha: .2),
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
