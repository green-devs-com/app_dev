import 'package:app_dev/core/provider/device_state.dart';
import 'package:app_dev/core/routes/routes_android.dart';
import 'package:app_dev/core/theme/dart_theme.dart';
import 'package:app_dev/core/theme/light_theme.dart';
import 'package:app_dev/screen/sign/welcome_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(
    ProviderScope(
      child: EasyLocalization(
        saveLocale: true,
        supportedLocales: [
          Locale("ko"),
          // Locale("en"),
          // Locale("ja"),
          // Locale("ru"),
        ],
        path: "assets/translation",
        fallbackLocale: const Locale("ko"),
        // fallbackLocale: const Locale("en"),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ref.watch(themeState),
      home: const WelcomePage(),
      onGenerateRoute: RoutesAndroid.onGenerateRoute,
    );
  }
}
