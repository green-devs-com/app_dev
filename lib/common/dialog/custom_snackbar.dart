import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String text,
  int? timer,
  double? fontSize,
  IconData? icon,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      backgroundColor: const Color(0xFF181818),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(8),
      content: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(icon, color: Colors.white),
            ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: fontSize ?? 15,
                color: Colors.white,
              ),
              softWrap: true,
              maxLines: 2,
            ),
          ),
        ],
      ),
      duration: Duration(seconds: timer ?? 2),
    ),
  );
}
