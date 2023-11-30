import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final ThemeData theme;
  final String logoPath;
  final List<IconData>? actionIcons;
  final List<VoidCallback>? onIconPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.theme,
    required this.logoPath,
    this.actionIcons,
    this.onIconPressed,
  });

  @override
  Size get preferredSize => const Size.fromHeight(52.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: theme.textTheme.displayMedium?.copyWith(
          fontSize: 23.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      leading: Padding(
        padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 14.w),
        child: Image.asset(
          logoPath,
        ),
      ),
      actions: _buildActionIcons(),
    );
  }

  List<Widget> _buildActionIcons() {
    List<Widget> widgets = [];

    if (actionIcons != null && onIconPressed != null) {
      for (int i = 0; i < actionIcons!.length; i++) {
        widgets.add(
          IconButton(
            icon: Icon(actionIcons![i]),
            onPressed: onIconPressed![i],
          ),
        );
      }
    }

    return widgets;
  }

  @override
  Widget get child => throw UnimplementedError();
}
