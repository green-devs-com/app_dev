import 'package:app_dev/common/widgets/custom_elevated_button.dart';
import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/page/farmer/widgets/farmer_profile_card.dart';
import 'package:app_dev/page/farmer/widgets/daily_status_card.dart';
import 'package:app_dev/page/farmer/widgets/home_job_list.dart';
import 'package:flutter/material.dart';

class FarmerHome extends StatelessWidget {
  const FarmerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          FarmerProfileCard(),
          SizedBox(height: 15),
          DailyStatusCard(),
          SizedBox(height: 20),
          HomeJobList(),
          const SizedBox(height: 25),
          Center(
            child: CustomElevatedButton(
              buttonHeight: 40,
              onPressed: () => Navigator.pushNamed(context, Routes.myjob),
              text: "전체 공고 보러가기",
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
