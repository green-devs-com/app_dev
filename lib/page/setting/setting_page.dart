import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:app_dev/page/setting/widgets/setting_account_item.dart';
import 'package:app_dev/page/setting/widgets/setting_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("설정"),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.chevron_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingAccountItem(),
            const SizedBox(height: 10),
            const Divider(height: 1, thickness: 1, color: Color(0xffF0F0F0)),
            const SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "앱 설정",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: context.theme.textColor!.withValues(alpha: 0.6),
                ),
              ),
            ),

            const SizedBox(height: 8),

            SettingItem(
              icon: CupertinoIcons.speaker,
              title: "공지사항",
              onTap: () {},
            ),

            SettingItem(
              icon: Icons.translate_rounded,
              title: "언어 설정",
              trailingText: "한국어",
              onTap: () {},
            ),

            SettingItem(
              icon: CupertinoIcons.bell,
              title: "알림 설정",
              onTap: () {},
            ),

            SettingItem(
              icon: CupertinoIcons.doc_text,
              title: "이용약관",
              onTap: () {},
            ),

            SettingItem(
              icon: CupertinoIcons.lock_shield,
              title: "개인정보 처리방침",
              onTap: () {},
            ),

            SettingItem(
              icon: CupertinoIcons.info_circle,
              title: "버전 정보",
              trailingText: "1.0.0",
              onTap: () {},
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
