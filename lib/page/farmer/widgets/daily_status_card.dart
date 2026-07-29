import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class DailyStatusCard extends StatelessWidget {
  const DailyStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: double.infinity,
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
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 상단 초록색 영역
          Container(
            width: double.infinity,
            height: 42,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            alignment: Alignment.centerLeft,
            color: context.theme.mainColor,
            child: const Text(
              "오늘의 현황",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // 하단 통계 영역
          SizedBox(
            height: 80,
            child: Row(
              children: [
                const Expanded(
                  child: _StatusItem(title: "지원자", value: '12', unit: "명"),
                ),

                _divider(),

                const Expanded(
                  child: _StatusItem(title: "근무 중 인원", value: '18', unit: "명"),
                ),

                _divider(),

                Expanded(
                  child: _StatusItem(
                    title: "모집 중 공고",
                    value: '3',
                    unit: "건",
                    onTap: () => Navigator.pushNamed(
                      context,
                      Routes.myjob,
                      arguments: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget _divider() {
    return Container(
      width: 1,
      height: 45,
      color: Colors.grey.withValues(alpha: 0.3),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String title;
  final String value;
  final String unit;
  final VoidCallback? onTap;

  const _StatusItem({
    required this.title,
    required this.value,
    required this.unit,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              color: Color(0xFF17251D),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 7),

          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: value,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF17251D),
                  ),
                ),
                TextSpan(
                  text: unit,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF3D594A),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
