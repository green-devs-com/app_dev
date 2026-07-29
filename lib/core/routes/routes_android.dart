import 'package:app_dev/core/routes/routes.dart';
import 'package:app_dev/page/auth/create_user_page.dart';
import 'package:app_dev/page/employee/employee_main_page.dart';
import 'package:app_dev/page/job/job_detail_page.dart';
import 'package:app_dev/page/job/my_job_page.dart';
import 'package:app_dev/page/management/farmer/applicant_detail_page.dart';
import 'package:app_dev/page/notification/notification_page.dart';
import 'package:app_dev/page/setting/setting_page.dart';
import 'package:app_dev/page/sign/identification_page.dart';
import 'package:app_dev/page/sign/welcome_page.dart';
import 'package:app_dev/page/farmer/farmer_main_page.dart';
import 'package:flutter/material.dart';

class RoutesAndroid {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // 초기 화면
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

      // 전화번호 인증
      case Routes.identification:
        return PageRouteBuilder(
          settings: const RouteSettings(name: Routes.identification),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const IdentificationPage(),
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

      // 유저 생성
      case Routes.createUser:
        return PageRouteBuilder(
          settings: const RouteSettings(name: Routes.createUser),
          pageBuilder: (context, animation, secondaryAnimation) =>
              const CreateUserPage(),
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

      // 농가 전용 화면
      case Routes.farmer:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.farmer),
          builder: (context) => const FarmerMainPage(),
        );

      // 외국인 전용 화면
      case Routes.employee:
        return MaterialPageRoute(
          settings: const RouteSettings(name: Routes.employee),
          builder: (context) => const EmployeeMainPage(),
        );

      // 설정 화면
      case Routes.setting:
        return MaterialPageRoute(builder: (context) => const SettingPage());

      // 최근 알림 화면
      case Routes.notification:
        return MaterialPageRoute(
          builder: (context) => const NotificationPage(),
        );

      // 내 전체 채용 공고 화면
      case Routes.myjob:
        return MaterialPageRoute(builder: (context) => MyJobPage());

      // 채용 상세 화면
      case Routes.jobDetail:
        return MaterialPageRoute(builder: (context) => const JobDetailPage());

      // 지원자 상세 화면
      case Routes.applicantDetail:
        return MaterialPageRoute(
          builder: (context) => const ApplicantDetailPage(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text("Not found"))),
        );
    }
  }
}
