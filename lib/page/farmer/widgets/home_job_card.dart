import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/job/widgets/job_status.dart';
import 'package:flutter/material.dart';

class HomeJobCard extends StatelessWidget {
  final String title;
  final int applicants;
  final int capacity;

  const HomeJobCard({
    super.key,
    required this.title,
    required this.applicants,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.jobDetail),
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: context.theme.textColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "시급 15,000원 | 4시간",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: context.theme.textColor!.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "모집 $capacity명 | 지원 $applicants명",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: context.theme.textColor!.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            JobStatus(),
          ],
        ),
      ),
    );
  }
}
