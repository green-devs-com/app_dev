import 'package:app_dev/common/widgets/user_profile_container.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingAccountItem extends StatelessWidget {
  const SettingAccountItem({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashFactory: NoSplash.splashFactory,
      highlightColor: const Color(0xffF7F7F7),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          children: [
            UserProfileContainer(),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "내 계정",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: context.theme.textColor,
                    ),
                  ),
                  Text(
                    "휴대폰 번호, 이메일, 본인인증 등",
                    style: TextStyle(
                      fontSize: 14,
                      color: context.theme.textColor!.withValues(alpha: 0.6),
                    ),
                  ),
                ],
              ),
            ),

            Icon(
              CupertinoIcons.chevron_right,
              size: 18,
              color: context.theme.textColor,
            ),
          ],
        ),
      ),
    );
  }
}
