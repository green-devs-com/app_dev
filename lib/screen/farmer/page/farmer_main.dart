import 'package:app_dev/common/widgets/custom_elevated_button.dart';
import 'package:app_dev/common/widgets/user_profile_container.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/screen/farmer/widgets/daily_status_card.dart';
import 'package:app_dev/screen/farmer/widgets/recruiting_list.dart';
import 'package:flutter/material.dart';

class FarmerMain extends StatelessWidget {
  const FarmerMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: IconButton(
          icon: const Icon(Icons.menu_rounded, size: 28),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, size: 28),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
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
          ),
          SizedBox(height: 15),
          DailyStatusCard(),
          SizedBox(height: 20),
          RecruitingList(),
          const SizedBox(height: 20),
          Center(
            child: CustomElevatedButton(
              buttonHeight: 40,
              onPressed: () {},
              text: "전체 공고 보러가기",
            ),
          ),
        ],
      ),
    );
  }
}
