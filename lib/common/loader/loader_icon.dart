import 'dart:async';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';

class IconLoader extends StatefulWidget {
  final double? iconSize;
  final Color? iconColor;

  const IconLoader({super.key, this.iconSize, this.iconColor});

  @override
  State<IconLoader> createState() => _IconLoaderState();
}

class _IconLoaderState extends State<IconLoader> {
  late Timer timer;
  late IconData currentIcon;
  int iconIndex = 0;
  final List<IconData> loadingIcons = [
    CupertinoIcons.hourglass_bottomhalf_fill,
    CupertinoIcons.hourglass,
    CupertinoIcons.hourglass_tophalf_fill,
  ];

  void _startLoadingAnimation() {
    timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      setState(() {
        iconIndex = (iconIndex + 1) % loadingIcons.length;
        currentIcon = loadingIcons[iconIndex];
      });
    });
  }

  @override
  void initState() {
    super.initState();
    currentIcon = loadingIcons[0];
    _startLoadingAnimation();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Icon(
      currentIcon,
      color:
          widget.iconColor ?? context.theme.iconColor!.withValues(alpha: 0.6),
      size: widget.iconSize ?? 25,
    );
  }
}
