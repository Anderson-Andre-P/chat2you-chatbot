import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../config/theme/dark_theme_colors.dart';
import '../../../../../config/theme/light_theme_colors.dart';
import '../../controllers/settings_controller.dart';

class SettingsList extends StatelessWidget {
  final List<SettingsItem> items;
  final String titleOfList;

  const SettingsList(
      {required this.items, super.key, required this.titleOfList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              titleOfList,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14.sp),
            ),
            const SizedBox(width: 8), // Ajuste o espaço conforme necessário
            const Expanded(
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...items.map((item) {
          if (item.isToggle) {
            return ToggleSettingsItem(item: item);
          } else {
            return SettingsItemWidget(item: item);
          }
        }),
      ],
    );
  }
}

class SettingsItem {
  final IconData icon;

  final String phrase;
  final IconData arrowIcon;
  final bool isToggle;
  final VoidCallback? onPressed;
  final ValueChanged<bool>? onToggle;
  final Color? iconColor;
  final Color? phraseColor;

  SettingsItem({
    required this.icon,
    this.iconColor,
    this.phraseColor,
    required this.phrase,
    required this.arrowIcon,
    this.isToggle = false,
    this.onPressed,
    this.onToggle,
  });
}

class SettingsItemWidget extends StatefulWidget {
  final SettingsItem item;

  const SettingsItemWidget({required this.item, super.key});

  @override
  State<SettingsItemWidget> createState() => _SettingsItemWidgetState();
}

class _SettingsItemWidgetState extends State<SettingsItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            widget.item.icon,
            size: 24,
            color: widget.item.iconColor ??
                (Theme.of(context).brightness == Brightness.light
                    ? LightThemeColors.iconColor
                    : DarkThemeColors.iconColor),
          ),
          title: Text(
            widget.item.phrase,
            style: Get.theme.textTheme.bodyMedium?.copyWith(
                fontSize: 16.sp,
                color: widget.item.phraseColor ??
                    (Theme.of(context).brightness == Brightness.light
                        ? LightThemeColors.bodyTextColor
                        : DarkThemeColors.bodyTextColor)
                // height: 1.15,
                ),
          ),
          tileColor: Get.theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.r),
          ),
          trailing: Icon(
            widget.item.arrowIcon,
            size: 20,
            color: widget.item.iconColor ??
                (Theme.of(context).brightness == Brightness.light
                    ? LightThemeColors.iconColor
                    : DarkThemeColors.iconColor),
          ),
          dense: true,
          onTap: widget.item.onPressed,
        ),
        const Divider(),
      ],
    );
  }
}

class ToggleSettingsItem extends StatefulWidget {
  final SettingsItem item;

  const ToggleSettingsItem({required this.item, super.key});

  @override
  State<ToggleSettingsItem> createState() => _ToggleSettingsItemState();
}

class _ToggleSettingsItemState extends State<ToggleSettingsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<SettingsController>(
          id: 'Theme',
          builder: (controller) {
            return ListTile(
              leading: Icon(
                widget.item.icon,
                size: 24,
              ),
              tileColor: Get.theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.r),
              ),
              title: SwitchListTile(
                onChanged: controller.changeTheme,
                value: !controller.isLightTheme,
                activeColor: Get.theme.primaryColor,
                dense: true,
                contentPadding: EdgeInsets.all(0.w),
                tileColor: Get.theme.scaffoldBackgroundColor,
                title: Text(
                  widget.item.phrase,
                  style: Get.theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 16.sp,
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
