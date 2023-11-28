import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/settings_controller.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isAccount;
  final bool isDark;
  const SettingsItem({
    Key? key,
    required this.title,
    required this.icon,
    this.isAccount = false,
    this.isDark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return ListTile(
      dense: true,
      title: Text(
        title,
        style: theme.textTheme.displayMedium?.copyWith(
          fontSize: 14.sp,
        ),
      ),
      subtitle: !isAccount
          ? null
          : Text(
              '+55 99 9 9999-9999',
              style: theme.textTheme.displaySmall,
            ),
      leading: CircleAvatar(
        radius: isAccount ? 25.r : 20.r,
        backgroundColor: theme.primaryColor,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      trailing: isDark
          ? GetBuilder<SettingsController>(
              id: 'Theme',
              builder: (controller) => CupertinoSwitch(
                value: !controller.isLightTheme,
                onChanged: controller.changeTheme,
                activeColor: theme.primaryColor,
              ),
            )
          : Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
    );
  }
}
