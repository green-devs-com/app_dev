import 'package:app_dev/common/widgets/user_profile_container.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class FarmerProfileCard extends StatelessWidget {
  const FarmerProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "안녕하세요,",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "행복농장님!",
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "오늘도 좋은 하루되세요.",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: context.theme.iconColor,
                ),
              ),
            ],
          ),
          UserProfileContainer(imageSize: 70),
        ],
      ),
    );
  }
}
