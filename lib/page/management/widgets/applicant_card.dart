import 'package:app_dev/common/widgets/user_profile_container.dart';
import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/management/widgets/applicant_status.dart';
import 'package:flutter/material.dart';

class ApplicantCard extends StatelessWidget {
  const ApplicantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, Routes.applicantDetail),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: const Color(0xffEEEEEE)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            UserProfileContainer(imageSize: 58),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "NGUYEN VAN A",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: context.theme.textColor,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.blueAccent,
                      ),
                      Text(
                        "전북 익산시 왕궁면",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "사과 수확",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: context.theme.textColor!.withValues(alpha: 0.6),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "06. 11 09:00 출근 예정",
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
            ApplicantStatus(),
          ],
        ),
      ),
    );
  }
}
