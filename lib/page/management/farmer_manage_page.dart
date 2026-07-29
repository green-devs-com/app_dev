import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/management/farmer/applicants_list.dart';
import 'package:app_dev/page/management/farmer/completed_list.dart';
import 'package:app_dev/page/management/farmer/confirmed_list.dart';
import 'package:flutter/material.dart';

class FarmerManagePage extends StatefulWidget {
  const FarmerManagePage({super.key});

  @override
  State<FarmerManagePage> createState() => _FarmerManagePageState();
}

class _FarmerManagePageState extends State<FarmerManagePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 0.3,
            dividerColor: context.theme.textColor!.withValues(alpha: 0.6),
            physics: NeverScrollableScrollPhysics(),
            splashFactory: NoSplash.splashFactory,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicatorColor: context.theme.mainColor,
            labelColor: context.theme.textColor,
            unselectedLabelColor: context.theme.textColor!.withValues(
              alpha: 0.6,
            ),
            tabs: [
              Tab(text: "지원자"),
              Tab(text: "확정 인원"),
              Tab(text: "작업 완료"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [ApplicantsList(), ConfirmedList(), CompletedList()],
        ),
      ),
    );
  }
}
