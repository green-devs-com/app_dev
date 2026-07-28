// import "dart:io";
// import "dart:ui";
// import "dart:developer";
// import "package:cloud_functions/cloud_functions.dart";
// import "package:easy_localization/easy_localization.dart";
// import "package:every_pal/common/dialog/show_alert_dialog.dart";
// import "package:every_pal/common/dialog/show_loading_dialog.dart";
// import "package:every_pal/common/dialog/custom_snackbar.dart";
// import "package:every_pal/common/report/report_result.dart";
// import "package:every_pal/core/models/user_model.dart";
// import "package:every_pal/core/provider/follow_state.dart";
// import "package:every_pal/core/service/local_data_service.dart";
// import "package:every_pal/core/service/validation.dart";
// import "package:every_pal/core/models/post_model.dart";
// import "package:every_pal/core/provider/auth_state.dart";
// import "package:every_pal/core/provider/device_state.dart";
// import "package:every_pal/core/routes/routes.dart";
// import "package:flutter/cupertino.dart";
// import "package:flutter_riverpod/flutter_riverpod.dart";
// import "package:google_mlkit_language_id/google_mlkit_language_id.dart";
// import "package:google_sign_in/google_sign_in.dart";

// final functionController = Provider((ref) {
//   return FunctionController(
//     ref: ref,
//     function: FirebaseFunctions.instanceFor(region: "asia-northeast3"),
//   );
// });

// class FunctionController {
//   final FirebaseFunctions function;
//   final Ref ref;

//   FunctionController({
//     required this.function,
//     required this.ref,
//   });

//   // 텍스트 번역
//   Future<String> textTranslator({
//     required String text,
//     String? target,
//   }) async {
//     String result = "";
//     final textLinks = TextLinks();
//     final languageIdentifier = LanguageIdentifier(confidenceThreshold: 0.5);
//     final Locale deviceLocale = PlatformDispatcher.instance.locale;
//     final String languageCode = deviceLocale.languageCode;
//     final handler = function.httpsCallable("textTranslator");

//     final validation = TextValidation(text);
//     if (validation.isSpecialTextOnly()) return text;
//     if (text.length <= 1) return text;
//     if (target == null || target == languageCode) {
//       final identify = await languageIdentifier.identifyLanguage(text);
//       if (identify == languageCode) return result = text;
//     }

//     String textWithoutUrls = textLinks.removeUrls(text);
//     if (textWithoutUrls.isEmpty) return text;

//     final response = await handler.call({
//       "text": textWithoutUrls.trim(),
//       "target": target ?? languageCode,
//     });
//     if (response.data["success"] == false) result = "error";
//     result = response.data["translatedText"] ?? "error";
//     return result;
//   }

//   // 새 게시물 업르도 알림 전송
//   void newPostNotification({
//     required String postId,
//     required String text,
//   }) async {
//     final length = text.length;
//     final user = ref.read(currentUserState).user;
//     final handler = function.httpsCallable("newPostNotification");
//     try {
//       await handler.call({
//         "username": user?.username ?? "Everypal User",
//         "postId": postId,
//         "url": user?.url ?? "",
//         "text": length > 160 ? '${text.substring(0, 160)}...' : text,
//       });
//     } catch (e) {
//       log("newPostNotification: $e");
//     }
//   }

//   // 팔로잉 알림 전송
//   void followingNotification({
//     required String uid,
//   }) async {
//     final user = ref.read(currentUserState).user;
//     final dateTime = ref.read(timeState.notifier).getTime();
//     final handler = function.httpsCallable("followingNotification");
//     try {
//       await handler.call({
//         "receiveUid": uid,
//         "username": user?.username ?? "Everypal User",
//         "date": dateTime.toString(),
//         "url": user?.url ?? "",
//       });
//     } catch (e) {
//       log("followingNotification: $e");
//     }
//   }

//   // 게시물 좋아요 알림 전송
//   void likeNotification({required PostModel post}) async {
//     if (auth.currentUser!.uid == post.uid) return;
//     final user = ref.read(currentUserState).user;
//     final handler = function.httpsCallable("likeNotification");
//     final dateTime = ref.read(timeState.notifier).getTime();
//     try {
//       await handler.call({
//         "receiveUid": post.uid,
//         "username": user?.username ?? "Everypal User",
//         "uid": auth.currentUser!.uid,
//         "sendAt": dateTime.toString(),
//         "postId": post.id,
//         "url": user?.url ?? "",
//       });
//     } catch (e) {
//       log("likeNotification: $e");
//     }
//   }

//   // 게시물 댓글 알림 전송
//   void commentNotification({
//     required String uid,
//     required String postId,
//     required String commentId,
//     required String type,
//     required String comment,
//   }) async {
//     final length = comment.length;
//     if (auth.currentUser!.uid == uid) return;
//     final user = ref.read(currentUserState).user;
//     final handler = function.httpsCallable("commentNotification");
//     final dateTime = ref.read(timeState.notifier).getTime();
//     try {
//       await handler.call({
//         "username": user?.username ?? "Everypal User",
//         "uid": auth.currentUser!.uid,
//         "postId": postId,
//         "commentId": commentId,
//         "type": type,
//         "sendAt": dateTime.toString(),
//         "receiveUid": uid,
//         "text": length > 160 ? '${comment.substring(0, 160)}...' : comment,
//         "url": user?.url ?? "",
//       });
//     } catch (e) {
//       log("commentNotification: $e");
//     }
//   }

//   // 채팅 메시지 알림 전송
//   void chatNotification({
//     required String message,
//     required String uid,
//     String? image,
//   }) async {
//     final user = ref.read(currentUserState).user;
//     final handler = function.httpsCallable("chatNotification");
//     final truncatedMessage =
//         message.length > 160 ? "${message.substring(0, 160)}..." : message;
//     await handler.call({
//       "username": user?.username ?? "Everypal User",
//       "userId": uid,
//       "message": truncatedMessage,
//       "url": user?.url ?? "",
//       "image": image,
//     });
//   }

//   // iOS 알림 뱃지 초기화
//   void resetBadgeCount() async {
//     try {
//       if (!Platform.isIOS) return;
//       final handler = function.httpsCallable("resetBadgeCount");
//       await handler.call();
//     } catch (e) {
//       throw Exception("resetBadgeCount_log: $e");
//     }
//   }

//   // 온라인 상태 업데이트
//   Future<void> updateLastSeen({required bool isOnline}) async {
//     final handler = function.httpsCallable("updateLastSeen");
//     final lastSeen = ref.read(timeState.notifier).getTime();
//     try {
//       await handler.call({"lastSeen": lastSeen, "isOnline": isOnline});
//     } catch (e) {
//       throw Exception("updateLastSeen_log: $e");
//     }
//   }

//   // 토큰 설정
//   Future<void> setToken() async {
//     final handler = function.httpsCallable("setToken");
//     final prefs = SharedPreferencesService.instance;
//     final dateTime = ref.read(timeState.notifier).getTime();
//     final lastUpdate = prefs.getInt("lastUpdate") ?? 0;
//     final difference = (dateTime - lastUpdate) / (1000 * 60 * 60 * 24 * 30);
//     bool isIOS = Platform.isIOS;

//     if (difference > 2 || lastUpdate == 0) {
//       String? token = await _getNewToken();
//       try {
//         if (token == null) return;
//         final response = await handler.call({"token": token, "isIOS": isIOS});
//         final result = response.data["success"] ?? false;
//         if (result) await prefs.setInt("lastUpdate", dateTime);
//       } catch (e) {
//         throw Exception("setToken_log: $e");
//       }
//     }
//   }

//   // 토큰 삭제
//   Future<void> removeToken() async {
//     final handler = function.httpsCallable("removeToken");
//     try {
//       final response = await handler.call();
//       final result = response.data["success"] ?? false;
//       if (!result) throw Exception("failed");
//       final isLogged = await GoogleSignIn().isSignedIn();
//       if (isLogged) await GoogleSignIn().signOut();
//       await resetAllState(ref, false);
//       await auth.signOut();
//     } catch (e) {
//       throw Exception("removeToken_log: $e");
//     }
//   }

//   // 계정 확인
//   Future<void> checkAccount({required BuildContext context}) async {
//     final handler = function.httpsCallable("checkAccount");
//     final prefs = SharedPreferencesService.instance;
//     final dateTime = ref.read(timeState.notifier).getTime();
//     bool isIOS = Platform.isIOS;

//     try {
//       await prefs.clear();
//       String? token = await fcm.getToken();
//       if (token == null) return;
//       final response = await handler.call({"token": token, "isIOS": isIOS});
//       final bool result = response.data["success"] ?? false;
//       final String message = response.data["message"] ?? "";
//       if (result) {
//         await prefs.setInt("lastUpdate", dateTime);
//         if (context.mounted) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             Routes.home,
//             (route) => false,
//           );
//         }
//       } else {
//         if (message == "not-found") {
//           if (context.mounted) {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               Routes.createUser,
//               (route) => false,
//             );
//           }
//         } else if (message == "deleted") {
//           final isLogged = await GoogleSignIn().isSignedIn();
//           if (isLogged) await GoogleSignIn().signOut();
//           await auth.signOut();
//           if (context.mounted) {
//             Navigator.pop(context);
//             customSnackBar(context: context, text: tr("error_deleted_account"));
//           }
//         } else {
//           throw Exception("error");
//         }
//       }
//     } catch (e) {
//       throw Exception("checkAccount_log: $e");
//     }
//   }

//   // 계정 삭제 (서버 데이터는 6개월간 보관 후 삭제)
//   Future<void> removeAccount({required BuildContext context}) async {
//     bool isConnected = ref.read(errorState.notifier).isConnected(context);
//     if (auth.currentUser == null || !isConnected) return;
//     final handler = function.httpsCallable("removeAccount");
//     loadingDialog(context: context, message: "Loading...");
//     try {
//       final response = await handler.call();
//       final result = response.data["success"] ?? false;
//       if (result) {
//         await Future.wait([
//           resetAllState(ref, true),
//           Future.delayed(const Duration(seconds: 1)),
//         ]);
//         final isLogged = await GoogleSignIn().isSignedIn();
//         if (isLogged) await GoogleSignIn().signOut();
//         await auth.signOut();
//         if (context.mounted) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             Routes.welcome,
//             (route) => false,
//           );
//           customSnackBar(context: context, text: tr("success_delete_account"));
//         }
//       } else {
//         if (context.mounted) {
//           Navigator.pop(context);
//           showAlertDialog(context: context, message: tr("error_normal"));
//         }
//       }
//     } catch (e) {
//       log("removeAccount: $e");
//       if (context.mounted) {
//         Navigator.pop(context);
//         showAlertDialog(context: context, message: tr("error_normal"));
//       }
//     }
//   }

//   // 계정 차단
//   Future<void> blockAccount({
//     required String uid,
//     required bool isBlock,
//   }) async {
//     final following = ref.read(followState).following;
//     final handler = function.httpsCallable("blockAccount");
//     try {
//       final response = await handler.call({
//         "uid": uid,
//         "isBlock": isBlock,
//         "isFollowing": following.contains(uid),
//       });
//       final result = response.data["success"] ?? false;
//       if (!result) throw Exception("failed");
//     } catch (e) {
//       throw Exception("blockAccount_log: $e");
//     }
//   }

//   // 게시물 신고
//   Future<void> reportPost({
//     required BuildContext context,
//     required String postId,
//     required String details,
//     required int section,
//   }) async {
//     final currentUid = auth.currentUser!.uid;
//     final handler = function.httpsCallable("reportPost");
//     loadingDialog(context: context, message: "Loading...");
//     try {
//       await Future.delayed(Duration(milliseconds: 500));
//       final response = await postReportRef
//           .where("postId", isEqualTo: postId)
//           .where("reporter", isEqualTo: currentUid)
//           .get();
//       if (response.docs.isNotEmpty) throw Exception("already-exists");
//       await handler.call({
//         "postId": postId,
//         "details": details,
//         "section": section,
//       });
//       if (context.mounted) {
//         Navigator.pop(context);
//         Navigator.pop(context);
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           reportResult(context: context);
//         });
//       }
//     } catch (e) {
//       log("reportPost: $e");
//       if (context.mounted) {
//         Navigator.pop(context);
//         bool isExisted = e.toString().contains("already-exists");
//         if (isExisted) {
//           customSnackBar(context: context, text: tr("error_reported_post"));
//         } else {
//           showAlertDialog(context: context, message: tr("error_normal"));
//         }
//       }
//     }
//   }

//   // 사용자 신고
//   Future<void> reportUser({
//     required BuildContext context,
//     required String uid,
//     required String details,
//     required int section,
//   }) async {
//     final currentUid = auth.currentUser!.uid;
//     final handler = function.httpsCallable("reportUser");
//     loadingDialog(context: context, message: "Loading...");
//     try {
//       await Future.delayed(Duration(milliseconds: 500));
//       final response = await userReportRef
//           .where("uid", isEqualTo: uid)
//           .where("reporter", isEqualTo: currentUid)
//           .get();
//       if (response.docs.isNotEmpty) throw Exception("already-exists");
//       await handler.call({
//         "uid": uid,
//         "section": section,
//         "details": details,
//       });
//       if (context.mounted) {
//         Navigator.pop(context);
//         Navigator.pop(context);
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           reportResult(context: context);
//         });
//       }
//     } catch (e) {
//       log("reportUser: $e");
//       if (context.mounted) {
//         Navigator.pop(context);
//         bool isExisted = e.toString().contains("already-exists");
//         if (isExisted) {
//           customSnackBar(context: context, text: tr("error_reported_user"));
//         } else {
//           showAlertDialog(context: context, message: tr("error_normal"));
//         }
//       }
//     }
//   }

//   // 메시지 삭제
//   void deleteMessages(String uid) async {
//     if (auth.currentUser == null) return;
//     final chatId = loadDocId(uid);
//     final handler = function.httpsCallable("deleteMessages");
//     try {
//       await handler.call({"chatId": chatId});
//     } catch (e) {
//       log("deleteMessages: $e");
//     }
//   }

//   // 클라우드 함수 테스트
//   void testCode(BuildContext context, UserModel user) async {
//     final baseTime = user.lastSeen;
//     final baseDate = DateTime.fromMillisecondsSinceEpoch(baseTime, isUtc: true);
//     final targetDate = baseDate.add(Duration(days: 3));
//     final targetTime = targetDate.millisecondsSinceEpoch;

//     try {
//       loadingDialog(context: context, message: "${user.username} UPDATED");
//       final handler = function.httpsCallable("testCode");
//       await handler.call({
//         "uid": user.uid,
//         "lastSeen": targetTime,
//         "password": "",
//       });
//     } catch (e) {
//       log("testCode: $e");
//     } finally {
//       if (context.mounted) Navigator.pop(context);
//     }
//   }

//   // 새로운 토큰 발급
//   Future<String?> _getNewToken() async {
//     String? fcmToken;
//     await fcm.deleteToken();
//     fcmToken = await fcm.getToken();
//     log("_getNewToken:$fcmToken");
//     return fcmToken;
//   }
// }
