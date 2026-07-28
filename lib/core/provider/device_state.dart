import 'dart:async';

import 'package:app_dev/common/dialog/custom_snackbar.dart';
import 'package:app_dev/main.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 개별 진행 프로세스 관리
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
final loadState = StateProvider.family.autoDispose<bool, String>(
  (ref, id) => false,
);

// 진행 프로세스 관리
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
final loadingProcessState = StateProvider.autoDispose<bool>((ref) => false);

// 네트워크 연결 상태 관리
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
final errorState = ChangeNotifierProvider<ErrorNotifier>(
  (ref) => ErrorNotifier(ref),
);

class ErrorNotifier extends ChangeNotifier {
  final Ref ref;
  bool isError = false;
  bool isInitialCheck = false;
  late StreamSubscription<List<ConnectivityResult>> connectSubscription;

  ErrorNotifier(this.ref) {
    initStatus();
    connectSubscription = Connectivity().onConnectivityChanged.listen(
      updateConnectionStatus,
    );
  }

  Future<void> initStatus() async {
    isInitialCheck = true;
    var result = await Connectivity().checkConnectivity();
    updateConnectionStatus(result);
  }

  void updateConnectionStatus(List<ConnectivityResult> result) {
    bool previousError = isError;
    isError = result.contains(ConnectivityResult.none);

    ScaffoldMessenger.of(
      navigatorKey.currentState!.context,
    ).removeCurrentSnackBar();

    if (isInitialCheck) {
      if (isError) {
        if (previousError != isError) {
          customSnackBar(
            context: navigatorKey.currentState!.context,
            text: "네트워크 연결을 확인해주세요.",
            icon: CupertinoIcons.exclamationmark_triangle,
            timer: 5,
          );
        }
      }
    }
    notifyListeners();
  }

  bool isConnected(BuildContext context) {
    if (isError) {
      customSnackBar(
        context: navigatorKey.currentState!.context,
        text: "네트워크 연결을 확인해주세요.",
        icon: CupertinoIcons.exclamationmark_triangle,
        timer: 5,
      );
      return false;
    }
    return true;
  }
}

// 테마 변경 관리
// -------------------------------------------------------------------------- //
// -------------------------------------------------------------------------- //
final themeState = StateNotifierProvider<ThemeNotifier, ThemeMode>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.system) {
    getThemeMode();
  }

  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();

  void getThemeMode() async {
    final theme = await _prefs.getString('theme');

    if (theme == "light") {
      state = ThemeMode.light;
    } else if (theme == "dark") {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.system;
    }
  }

  void setThemeMode({required ThemeMode themeMode}) async {
    if (themeMode == ThemeMode.light) {
      await _prefs.setString('theme', 'light');
      state = ThemeMode.light;
    } else if (themeMode == ThemeMode.dark) {
      await _prefs.setString('theme', 'dark');
      state = ThemeMode.dark;
    } else {
      await _prefs.setString('theme', 'system');
      state = ThemeMode.system;
    }
  }
}
