import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/farmer/widgets/home_job_card.dart';
import 'package:flutter/material.dart';

class HomeJobList extends StatelessWidget {
  const HomeJobList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20, bottom: 12),
          child: Text(
            "진행 중인 공고",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: context.theme.textColor,
            ),
          ),
        ),
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
              HomeJobCard(title: '딸기 수확 알바', applicants: 7, capacity: 15),
              _divider(),
              HomeJobCard(title: '사과 수확 알바', applicants: 3, capacity: 10),
              _divider(),
              HomeJobCard(title: '감자 선별 작업', applicants: 5, capacity: 8),
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
