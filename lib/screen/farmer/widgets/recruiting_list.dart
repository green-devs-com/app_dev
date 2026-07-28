import 'package:app_dev/common/widgets/custom_elevated_button.dart';
import 'package:app_dev/common/widgets/user_profile_container.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class RecruitingList extends StatelessWidget {
  const RecruitingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            '진행 중인 공고',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.theme.textColor,
            ),
          ),
        ),

        const SizedBox(height: 12),

        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              _RecruitItem(
                image: 'assets/images/profile1.jpg',
                title: '딸기 수확 알바',
                applicants: 7,
                capacity: 15,
                onTap: () {},
              ),
              _divider(),
              _RecruitItem(
                image: 'assets/images/profile2.jpg',
                title: '사과 수확 알바',
                applicants: 3,
                capacity: 10,
                onTap: () {},
              ),
              _divider(),
              _RecruitItem(
                image: 'assets/images/profile3.jpg',
                title: '감자 선별 작업',
                applicants: 5,
                capacity: 8,
                onTap: () {},
              ),
              _divider(),
              _RecruitItem(
                image: 'assets/images/profile3.jpg',
                title: '오이 선별 작업',
                applicants: 2,
                capacity: 3,
                onTap: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _divider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.black.withValues(alpha: 0.05),
    );
  }
}

class _RecruitItem extends StatelessWidget {
  final String image;
  final String title;
  final int applicants;
  final int capacity;
  final VoidCallback onTap;

  const _RecruitItem({
    required this.image,
    required this.title,
    required this.applicants,
    required this.capacity,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            UserProfileContainer(imageSize: 44),

            // 프로
            const SizedBox(width: 12),

            // 공고 정보
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    '지원 $applicants명 / 모집 $capacity명',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF777777),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // 모집중
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F8EF),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '모집중',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF159455),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
