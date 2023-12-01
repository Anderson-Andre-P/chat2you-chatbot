import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';
import '../../utils/constants.dart';
import '../routes/app_pages.dart';
import 'custom_image_view.dart';

class CustomLoginHeader extends StatelessWidget {
  const CustomLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomImageView(
          imagePath: Constants.logo,
          width: 100.w,
          onTap: () => Get.toNamed(Routes.BASE),
        ),
        52.verticalSpace,
        Text(
          Strings.titleOfTheApp.tr,
          textAlign: TextAlign.center,
          style: Get.theme.textTheme.displayMedium?.copyWith(
            fontSize: 46.sp,
            fontWeight: FontWeight.normal,
            height: 1.2.h,
          ),
        ),
        8.verticalSpace,
        Text(
          Strings.loginSubtitle.tr,
          textAlign: TextAlign.center,
          style: Get.theme.textTheme.bodyMedium?.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        52.verticalSpace,
      ],
    );
  }
}
