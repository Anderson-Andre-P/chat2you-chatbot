import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final String title;
  final ThemeData theme;
  final String logoPath;

  const CustomAppBar(
      {super.key,
      required this.title,
      required this.theme,
      required this.logoPath});

  @override
  Size get preferredSize => const Size.fromHeight(100);

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
    );
  }

  @override
  Widget get child => throw UnimplementedError();
}
