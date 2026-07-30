import 'package:app_dev/common/widgets/user_profile_container.dart';
import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserProfileContainer(imageSize: 58),
            const SizedBox(width: 12),

            /// 지원자 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 이름
                  Text(
                    "NGUYEN VAN A",
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

                  /// 국적 / 성별 / 나이
                  Text(
                    "베트남  |  남성(만 27세)",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: context.theme.textColor!.withValues(alpha: 0.7),
                    ),
                  ),

                  const SizedBox(height: 2),

                  /// 근무 가능기간 / 언어
                  Text(
                    "언어: 한국어 중급",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: context.theme.textColor!.withValues(alpha: 0.7),
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// 버튼
                  Row(
                    children: [
                      /// 채용 승인
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              // 승인
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: context.theme.mainColor,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              "채용 승인",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      /// 거절
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: ElevatedButton(
                            onPressed: () {
                              // 거절
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xffF3F3F3),
                              foregroundColor: const Color(0xff555555),
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              "거절",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: context.theme.textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
