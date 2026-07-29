import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/job/widgets/job_status.dart';
import 'package:flutter/material.dart';

class ApplicantDetailPage extends StatelessWidget {
  const ApplicantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildHeader(context),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "딸기 수확 보조",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: context.theme.textColor,
                                ),
                              ),
                            ),
                            JobStatus(),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: 17,
                              color: Color(0xff9A9A9A),
                            ),
                            Text(
                              "전북 익산시 왕궁면",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: context.theme.textColor!.withValues(
                                  alpha: 0.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "120,000원",
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: context.theme.textColor,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                "/ 일",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        _InfoRow(
                          icon: Icons.calendar_today_outlined,
                          title: "날짜",
                          value: "2024. 6. 10 (화)",
                        ),
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.access_time,
                          title: "시간",
                          value: "08:00 ~ 17:00 (휴식 1시간)",
                        ),
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.people_outline,
                          title: "인원",
                          value: "5명",
                        ),
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.work_outline,
                          title: "업무",
                          value: "딸기 수확 및 선별",
                        ),
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.shopping_bag_outlined,
                          title: "준비물",
                          value: "편한 복장, 장갑 (제공), 점심",
                        ),
                        const SizedBox(height: 12),
                        _InfoRow(
                          icon: Icons.directions_car_outlined,
                          title: "이동",
                          value: "차량 제공 (익산역 07:00 출발)",
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "지원자 정보",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: context.theme.textColor,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Row(
                          children: [
                            /// 농가 프로필
                            ClipOval(
                              child: Image.asset(
                                "assets/images/profile_image.png",
                                width: 58,
                                height: 58,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NGUYEN VAN A",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.textColor,
                                    ),
                                  ),
                                  const SizedBox(height: 5),

                                  /// 국적 / 성별 / 나이
                                  Text(
                                    "베트남  |  남성(만 27세)",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: context.theme.textColor!
                                          .withValues(alpha: 0.7),
                                    ),
                                  ),

                                  const SizedBox(height: 2),

                                  /// 근무 가능기간 / 언어
                                  Text(
                                    "언어: 한국어 중급",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: context.theme.textColor!
                                          .withValues(alpha: 0.7),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        size: 15,
                                        color: Color(0xffFFB800),
                                      ),
                                      const Text(
                                        "4.8",
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xffF0A800),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        "(리뷰 32)",
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: context.theme.textColor!
                                              .withValues(alpha: 0.8),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          /// 하단 버튼
        ],
      ),
    );
  }

  /// 상단 이미지
  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 270,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/profile_image.png", fit: BoxFit.cover),

          /// 이미지 어둡게
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withValues(alpha: 0.2),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          /// 뒤로가기
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            left: 15,
            child: _CircleButton(
              icon: Icons.arrow_back_ios_new_rounded,
              onTap: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 23,
          child: Icon(icon, size: 17, color: const Color(0xff9AA3AF)),
        ),

        const SizedBox(width: 5),

        SizedBox(
          width: 55,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xff777777),
            ),
          ),
        ),

        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: Color(0xff555555),
            ),
          ),
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.55),
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Icon(icon, size: 21, color: Colors.white),
      ),
    );
  }
}
