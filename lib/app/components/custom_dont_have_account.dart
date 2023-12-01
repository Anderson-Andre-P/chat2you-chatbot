import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/translations/strings_enum.dart';
import '../routes/app_pages.dart';

class CustomDontHaveAccount extends StatelessWidget {
  const CustomDontHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: Strings.dontaHaveAccount.tr,
          style: Get.theme.textTheme.bodyMedium?.copyWith(
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          children: [
            TextSpan(
              text: " ${Strings.signUpButton.tr}",
              style: Get.theme.textTheme.bodyMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Get.theme.primaryColor,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.SIGNUP);
                },
            )
          ]),
    );
  }
}
