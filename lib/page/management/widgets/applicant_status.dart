import 'package:flutter/material.dart';

class ApplicantStatus extends StatelessWidget {
  const ApplicantStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F8EF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        "모집중",
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: Color(0xFF159455),
        ),
      ),
    );
  }
}
