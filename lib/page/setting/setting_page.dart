import 'package:app_dev/common/widgets/custom_tile.dart';
import 'package:app_dev/common/widgets/custom_user_tile.dart';
import 'package:app_dev/core/theme/custom_theme.dart';
import 'package:easy_localization/easy_localization.dart';
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
          children: [
            CustomTile(title: tr("user_settings"), showTrailing: false),
            CustomUserTile(
              // onTap: () => Navigator.pushNamed(context, Routes.setting),
              title: tr("account_info"),
              isBold: false,
            ),
            CustomUserTile(
              // onTap: () => Navigator.pushNamed(
              //   context,
              //   Routes.profileUpdate,
              //   arguments: {"user": status.user!},
              // ),
              title: tr("profile_info"),
              isBold: false,
            ),
            CustomUserTile(
              title: tr("blocked_account"),
              // onTap: () => Navigator.pushNamed(context, Routes.blockList),
              isBold: false,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: context.theme.greyColor!.withValues(alpha: 0.5),
                thickness: 0.5,
                height: 0,
              ),
            ),
            CustomTile(title: tr("system_settings"), showTrailing: false),
            // const NotificationSetting(),
            // CustomUserTile(
            //   onTap: () =>
            //       showLanguageMenu(context: context, ref: ref, isRefresh: true),
            //   title: tr("language"),
            //   trailing: languageStatus(context),
            //   isBold: false,
            // ),
            // const ThemeSetting(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                color: context.theme.greyColor!.withValues(alpha: 0.5),
                thickness: 0.5,
                height: 0,
              ),
            ),
            CustomUserTile(title: tr("other_settings")),
            CustomUserTile(
              // onTap: () => launchInfoURL(status: 0),
              title: tr("csae_policy"),
              isBold: false,
            ),
            CustomUserTile(
              // onTap: () => launchInfoURL(status: 1),
              title: tr("privacy_policy"),
              isBold: false,
            ),
            CustomUserTile(
              // onTap: () => launchInfoURL(status: 2),
              title: tr("terms_of_user"),
              isBold: false,
            ),
            CustomUserTile(
              // onTap: () => showContactMenu(context: context, ref: ref),
              title: tr("contact"),
              isBold: false,
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
