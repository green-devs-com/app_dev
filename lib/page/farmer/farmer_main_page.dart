import 'dart:developer';
import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/page/chat/chat_page.dart';
import 'package:app_dev/page/job/job_page.dart';
import 'package:app_dev/page/farmer/farmer_home.dart';
import 'package:app_dev/page/management/management_page.dart';
import 'package:flutter/material.dart';

class FarmerMainPage extends StatefulWidget {
  const FarmerMainPage({super.key});

  @override
  State<FarmerMainPage> createState() => _FarmerMainPageState();
}

class _FarmerMainPageState extends State<FarmerMainPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late PageController pageController;
  bool isLoading = false;
  int page = 0;

  Widget? title() {
    switch (page) {
      case 0:
        return const SizedBox.shrink();

      case 1:
        return const Text("채용공고");

      case 2:
        return const Text("인력 관리");

      case 3:
        return const Text("메시지");

      default:
        return null;
    }
  }

  void onPageChanged(int index) {
    setState(() => page = index);
  }

  void movePage(int index) {
    pageController.jumpToPage(index);
    setState(() => page = index);
  }

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        log("AppLifecycleState.resumed");
        break;
      case AppLifecycleState.paused:
        log("AppLifecycleState.paused");
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: SafeArea(
          top: false,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              title: title(),
              leading: IconButton(
                icon: const Icon(Icons.menu_rounded, size: 28),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.setting);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none, size: 28),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.notification);
                  },
                ),
              ],
            ),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [FarmerHome(), JobPage(), ManagementPage(), ChatPage()],
            ),
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 25,
              items: [
                BottomNavigationBarItem(
                  label: "홈",
                  activeIcon: Icon(Icons.home, size: 30),
                  icon: Icon(Icons.home_outlined, size: 30),
                ),
                BottomNavigationBarItem(
                  label: "채용공고",
                  icon: Icon(Icons.assignment_add, size: 30),
                ),
                BottomNavigationBarItem(
                  label: "관리",
                  icon: Icon(Icons.assessment_outlined, size: 30),
                ),
                BottomNavigationBarItem(
                  label: "메시지",
                  activeIcon: Icon(Icons.chat, size: 30),
                  icon: Icon(Icons.chat_outlined, size: 30),
                ),
              ],
              onTap: movePage,
              currentIndex: page,
            ),
          ),
        ),
      ),
    );
  }
}
