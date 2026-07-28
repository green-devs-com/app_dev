import 'dart:developer';

import 'package:app_dev/common/widgets/icon_container.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
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

  void navigationTapped(int index) {
    if (index == 1) {
      movePage(index);
    } else if (index == 2) {
    } else if (index == 3) {
      movePage(index);
    } else {
      movePage(index);
    }
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
                Center(child: Text("1")),
                Center(child: Text("2")),
                SizedBox(),
                Center(child: Text("3")),
                Center(child: Text("4")),
              ],
            ),
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: Colors.transparent,
              activeColor: context.theme.textColor,
              inactiveColor: context.theme.textColor!.withValues(alpha: 0.4),
              iconSize: 25,
              height: 55,
              items: [
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 43,
                    child: IconContainer(
                      size: 22,
                      icon: "home.svg",
                      color: page == 0
                          ? context.theme.mainColor!
                          : context.theme.textColor!.withValues(alpha: 0.4),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconContainer(
                    size: 22,
                    icon: "search.svg",
                    color: page == 1
                        ? context.theme.mainColor!
                        : context.theme.textColor!.withValues(alpha: 0.4),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconContainer(
                    size: 22,
                    icon: "edit.svg",
                    color: context.theme.textColor!.withValues(alpha: 0.4),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: SizedBox(
                    height: 43,
                    child: Center(
                      child: Icon(
                        CupertinoIcons.chat_bubble_2,
                        size: 28,
                        color: page == 3
                            ? context.theme.mainColor!
                            : context.theme.textColor!.withValues(alpha: 0.4),
                      ),
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: IconContainer(
                    size: 22,
                    icon: "user.svg",
                    color: page == 4
                        ? context.theme.mainColor!
                        : context.theme.textColor!.withValues(alpha: 0.4),
                  ),
                ),
              ],
              onTap: navigationTapped,
              currentIndex: page,
            ),
          ),
        ),
      ),
    );
  }
}
