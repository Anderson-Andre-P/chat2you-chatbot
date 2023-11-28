import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/settings_controller.dart';
import 'widgets/settings_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: ListView(
          shrinkWrap: true,
          children: [
            Text(
              'Account',
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            16.verticalSpace,
            const SettingsItem(
              title: 'John Doe',
              icon: Icons.person,
              isAccount: true,
            ),
            30.verticalSpace,
            Text(
              'Settings',
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            8.verticalSpace,
            const SettingsItem(
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              isDark: true,
            ),
            8.verticalSpace,
            const SettingsItem(
              title: 'Language',
              icon: Icons.language,
            ),
            8.verticalSpace,
            const SettingsItem(
              title: 'Help',
              icon: Icons.settings,
            ),
            8.verticalSpace,
            const SettingsItem(
              title: 'Sign Out',
              icon: Icons.logout,
            ),
            8.verticalSpace,
          ],
        ),
      ),
    );
  }
}
