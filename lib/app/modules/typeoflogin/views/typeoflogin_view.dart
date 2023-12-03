import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_dont_have_account.dart';
import '../../../components/custom_login_header_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/typeoflogin_controller.dart';

class TypeofloginView extends GetView<TypeofloginController> {
  const TypeofloginView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomLoginHeader(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: Strings.socialLoginGoogle,
                  backgroundColor: theme.cardColor,
                  borderColor: theme.highlightColor,
                  foregroundColor: theme.brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black54,
                  hasShadow: false,
                  onPressed: () {},
                ),
                8.verticalSpace,
                CustomButton(
                  text: Strings.socialLoginFacebook,
                  backgroundColor: theme.cardColor,
                  borderColor: theme.highlightColor,
                  foregroundColor: theme.brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black54,
                  hasShadow: false,
                  onPressed: () {},
                ),
                8.verticalSpace,
                CustomButton(
                  text: Strings.socialLoginApple,
                  backgroundColor: theme.cardColor,
                  borderColor: theme.highlightColor,
                  foregroundColor: theme.brightness == Brightness.dark
                      ? Colors.white70
                      : Colors.black54,
                  hasShadow: false,
                  onPressed: () {},
                ),
              ],
            ),
            16.verticalSpace,
            const CustomDivider(),
            16.verticalSpace,
            CustomButton(
              text: Strings.signInButton,
              hasShadow: false,
              onPressed: () => Get.toNamed(Routes.SIGNIN),
            ),
            16.verticalSpace,
            const CustomDontHaveAccount()
          ],
        ),
      ),
    );
  }
}
