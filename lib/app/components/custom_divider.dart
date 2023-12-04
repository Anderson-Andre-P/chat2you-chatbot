import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: theme.dividerColor,
              thickness: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              Strings.or.tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          Expanded(
            child: Divider(
              color: theme.dividerColor,
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
