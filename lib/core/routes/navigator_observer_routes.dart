// import 'dart:io';
// import 'package:every_pal/core/notification/aos_notification.dart';
// import 'package:every_pal/core/notification/ios_notification.dart';
// import 'package:every_pal/core/routes/routes.dart';
// import 'package:flutter/material.dart';

String? currentRoute;
String? lastRoutes;
bool callCurrentUser = false;
bool callChatList = false;
bool callBlackLst = false;
bool notificationRoute = false;
Set<String> navigation = {};

// class NavigatorObserverRoutes extends NavigatorObserver {
//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPush(route, previousRoute);
//     currentRoute = route.settings.name ?? "";
//     lastRoutes = previousRoute?.settings.name ?? "";
//     _handleRoutePush(route, previousRoute);
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     super.didPop(route, previousRoute);
//     currentRoute = previousRoute?.settings.name ?? "";
//     lastRoutes = route.settings.name ?? "";
//     _handleRoutePop(route, previousRoute);
//   }

//   void _handleRoutePush(
//     Route<dynamic> route,
//     Route<dynamic>? previousRoute,
//   ) async {
//     if (currentRoute == Routes.chat) {
//       final args = route.settings.arguments as Map<String, dynamic>;
//       final String uid = args["uid"];
//       if (Platform.isIOS) {
//         showNotificationAlerts(currentRoute, uid);
//         removeHandler("chat");
//       } else {
//         AOSNotifications().clearNotification();
//       }
//     } else if (currentRoute == Routes.notification) {
//       if (Platform.isIOS) {
//         showNotificationAlerts(currentRoute);
//         removeHandler("post");
//       } else {
//         AOSNotifications().clearNotification();
//       }
//     } else {
//       if (Platform.isIOS) showNotificationAlerts(currentRoute);
//     }
//   }

//   void _handleRoutePop(
//     Route<dynamic> route,
//     Route<dynamic>? previousRoute,
//   ) async {
//     if (currentRoute == Routes.chat) {
//       final args = previousRoute?.settings.arguments as Map<String, dynamic>;
//       final String uid = args["uid"];
//       if (Platform.isIOS) {
//         showNotificationAlerts(currentRoute, uid);
//         removeHandler("chat");
//       } else {
//         AOSNotifications().clearNotification();
//       }
//     } else if (currentRoute == Routes.notification) {
//       if (Platform.isIOS) {
//         showNotificationAlerts(currentRoute);
//         removeHandler("post");
//       } else {
//         AOSNotifications().clearNotification();
//       }
//     } else {
//       if (Platform.isIOS) showNotificationAlerts(currentRoute);
//     }
//   }
// }
