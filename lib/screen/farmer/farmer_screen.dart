import 'dart:developer';
import 'package:app_dev/screen/farmer/page/farmer_main.dart';
import 'package:flutter/material.dart';

class FarmerScreen extends StatefulWidget {
  const FarmerScreen({super.key});

  @override
  State<FarmerScreen> createState() => _FarmerScreenState();
}

class _FarmerScreenState extends State<FarmerScreen>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  late PageController pageController;
  bool isLoading = false;
  int page = 0;

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
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              onPageChanged: onPageChanged,
              children: [
                FarmerMain(),
                Center(child: Text(page.toString())),
                Center(child: Text(page.toString())),
                Center(child: Text(page.toString())),
              ],
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
                  label: "근무관리",
                  icon: Icon(Icons.assessment_outlined, size: 30),
                ),
                BottomNavigationBarItem(
                  label: "MY",
                  activeIcon: Icon(Icons.person, size: 30),
                  icon: Icon(Icons.person_outline, size: 30),
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
