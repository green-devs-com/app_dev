// import 'package:every_pal/core/provider/device_state.dart';
// import 'package:every_pal/core/routes/navigator_observer_routes.dart';
// import 'package:every_pal/core/routes/routes.dart';
// import 'package:every_pal/main.dart';
// import 'package:flutter/scheduler.dart';

// bool isActived = false;

// void notificationHandler(Map<String, dynamic>? data) {
//   if (data == null) return;
//   if (auth.currentUser?.uid == null) {
//     if (isActived) {
//       navigatorKey.currentState?.pushNamed(Routes.welcome);
//     } else {
//       SchedulerBinding.instance.addPostFrameCallback((_) async {
//         await Future.delayed(const Duration(seconds: 2));
//         navigatorKey.currentState?.pushNamed(Routes.welcome);
//       });
//     }
//   } else {
//     final String type = data["type"];
//     switch (type) {
//       case "chat":
//         _handleChatNotification(data);
//         break;
//       case "new_post":
//         _handlePostNotification();
//         break;
//       default:
//         _handleNotification(data);
//         break;
//     }
//   }
// }

// void _handleChatNotification(Map<String, dynamic> data) {
//   final String uid = data["uid"];
//   if (navigation.contains(uid)) {
//     navigatorKey.currentState?.popUntil((route) {
//       if (route.settings.name == Routes.chat &&
//           route.settings.arguments is Map<String, dynamic>) {
//         final args = route.settings.arguments as Map<String, dynamic>;
//         return args["uid"] == uid;
//       }
//       return false;
//     });
//   } else {
//     if (isActived) {
//       navigatorKey.currentState?.pushNamedAndRemoveUntil(
//         Routes.chat,
//         (route) {
//           return route.isFirst;
//         },
//         arguments: {"uid": uid},
//       );
//     } else {
//       SchedulerBinding.instance.addPostFrameCallback((_) async {
//         await Future.delayed(const Duration(seconds: 2));
//         navigatorKey.currentState?.pushNamed(
//           Routes.chat,
//           arguments: {"uid": uid},
//         );
//       });
//     }
//   }
// }

// void _handleNotification(Map<String, dynamic> data) {
//   final String type = data["type"];
//   if (type == "like" || type == "comment" || type == "reply") {
//     if (notificationRoute) {
//       navigatorKey.currentState?.popUntil((route) {
//         if (route.settings.name == Routes.notification) {
//           return true;
//         }
//         return false;
//       });
//     } else {
//       if (isActived) {
//         navigatorKey.currentState?.pushNamed(Routes.notification);
//       } else {
//         SchedulerBinding.instance.addPostFrameCallback((_) async {
//           await Future.delayed(const Duration(seconds: 2));
//           navigatorKey.currentState?.pushNamed(Routes.notification);
//         });
//       }
//     }
//   } else if (type == "follower") {
//     if (notificationRoute) {
//       navigatorKey.currentState?.popUntil((route) {
//         if (route.settings.name == Routes.notification) {
//           return true;
//         }
//         return false;
//       });
//     } else {
//       if (isActived) {
//         if (currentRoute == Routes.followList) {
//           navigatorKey.currentState?.pushReplacementNamed(Routes.followList);
//         } else {
//           navigatorKey.currentState?.pushNamed(Routes.followList);
//         }
//       } else {
//         SchedulerBinding.instance.addPostFrameCallback((_) async {
//           await Future.delayed(const Duration(seconds: 2));
//           navigatorKey.currentState?.pushNamed(Routes.notification);
//         });
//       }
//     }
//   }
// }

// void _handlePostNotification() {
//   if (isActived) {
//     navigatorKey.currentState?.pushNamed(Routes.notification);
//   } else {
//     SchedulerBinding.instance.addPostFrameCallback((_) async {
//       await Future.delayed(const Duration(seconds: 2));
//       navigatorKey.currentState?.pushNamed(Routes.notification);
//     });
//   }
// }
