import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/screen/sign/welcome_page.dart';
import 'package:flutter/material.dart';

class RoutesAndroid {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.welcome:
        return PageRouteBuilder(
          settings: const RouteSettings(name: Routes.welcome),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const WelcomePage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeOutExpo;
            var tween = Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(position: offsetAnimation, child: child);
          },
          transitionDuration: const Duration(milliseconds: 200),
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("Not found"))),
        );
    }
  }
}
