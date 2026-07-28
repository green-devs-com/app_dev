import 'package:easy_localization/easy_localization.dart';

typedef ValidationFunction = bool Function();

class Validation {
  final ValidationFunction validation;
  final String messageKey;

  Validation(this.validation, this.messageKey);
}

RegExp usernameType = RegExp(r'^[a-zA-Z0-9가-힣ぁ-ゔァ-ヴー々〆〤一-龥_]+$');
RegExp emailType = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
RegExp passwordType = RegExp(
  r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#\$&*~])[A-Za-z\d!@#\$&*~]+$',
);

class UsernameValidation {
  final String name;
  UsernameValidation(this.name);

  List<Validation> get validations => [
    Validation(() => name.isEmpty, tr("error_username")),
    Validation(() => name.length < 5, tr("error_username_length")),
    Validation(() => !usernameType.hasMatch(name), tr("error_username_type")),
  ];
}

class TextValidation {
  final String text;

  TextValidation(this.text);

  RegExp numberOnly = RegExp(r'^\d+$');
  RegExp emojiOnly = RegExp(r'^[\u{1F600}-\u{1F64F}]+$', unicode: true);
  RegExp symbolOnly = RegExp(r'^[\p{S}\p{P}]+$', unicode: true);
  RegExp mixed = RegExp(r'^[\d\u{1F600}-\u{1F64F}\p{S}\p{P}]+$', unicode: true);

  bool isSpecialTextOnly() {
    return numberOnly.hasMatch(text) ||
        emojiOnly.hasMatch(text) ||
        symbolOnly.hasMatch(text) ||
        mixed.hasMatch(text);
  }
}

// 텍스트 url 추출
// class TextLinks {
//   RegExp urlType = RegExp(
//     r'\bwww\.[a-zA-Z0-9\-.]+\.[a-zA-Z]{2,}(\/\S*)?\b',
//     caseSensitive: false,
//   );

//   List<TextSpan> textWithURL({
//     required String text,
//     FontWeight? fontWeight,
//     double? fontSize,
//   }) {
//     final List<TextSpan> textSpans = [];
//     int lastIndex = 0;

//     for (final match in urlType.allMatches(text)) {
//       final url = match.group(0) ?? '';
//       if (url.isEmpty) continue;

//       final start = match.start;
//       final end = match.end;

//       if (start > lastIndex) {
//         textSpans.add(TextSpan(text: text.substring(lastIndex, start)));
//       }

//       textSpans.add(
//         TextSpan(
//           text: url.toLowerCase(),
//           style: TextStyle(
//             decoration: TextDecoration.underline,
//             color: Colors.blue,
//             fontWeight: fontWeight,
//             fontSize: fontSize ?? 14,
//             height: 1.2,
//           ),
//           recognizer: TapGestureRecognizer()..onTap = () => launchURL(url),
//         ),
//       );

//       lastIndex = end;
//     }

//     if (lastIndex < text.length) {
//       textSpans.add(TextSpan(text: text.substring(lastIndex)));
//     }

//     return textSpans;
//   }

//   // URL 제거
//   String removeUrls(String text) {
//     return text.replaceAll(urlType, '').trim();
//   }

//   // URL 추출
//   List<String> getUrls(String text) {
//     return urlType
//         .allMatches(text)
//         .map((match) => match.group(0) ?? '')
//         .toList();
//   }

  // URL 열기
  // Future<void> launchURL(String link) async {
  //   final normalizedUrl = _normalizeUrl(link);
  //   final url = Uri.parse(normalizedUrl);
  //   try {
  //     final isConfirm = await showProcessDialog(
  //       context: navigatorKey.currentContext!,
  //       title: tr("click_url_title"),
  //       body: "${tr("click_url_body")}\n $normalizedUrl",
  //     );
  //     if (isConfirm) await launchUrl(url, mode: LaunchMode.platformDefault);
  //   } catch (e) {
  //     log("_launchURL: $e");
  //   }
  // }

  // 프로토콜
  // String _normalizeUrl(String url) {
  //   final hasScheme = RegExp(r'^https?:\/\/').hasMatch(url);
  //   return hasScheme ? url : 'https://$url';
  // }
// }
