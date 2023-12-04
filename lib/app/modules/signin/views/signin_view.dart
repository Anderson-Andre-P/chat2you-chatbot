import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_divider.dart';
import '../../../components/custom_dont_have_account.dart';
import '../../../components/custom_icon_button.dart';
import '../../../components/custom_login_header_widget.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signin_controller.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  _SigninViewState createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  SigninController controller = Get.find<SigninController>();
  bool rememberMe = true;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              48.verticalSpace,
              const CustomLoginHeader(),
              Form(
                key: controller.formKeySignIn,
                child: Column(
                  children: [
                    CustomTextField(
                      label: Strings.email.tr,
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                      controller: controller.emailController,
                      validator: controller.validateEmail,
                    ),
                    16.verticalSpace,
                    CustomTextField(
                      label: Strings.password.tr,
                      prefixIcon: Icons.password_outlined,
                      keyboardType: TextInputType.text,
                      isPassword: true,
                      controller: controller.passwordController,
                      validator: controller.validatePassword,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      padding: MaterialStateProperty.all(
                        EdgeInsets.all(
                          8.w,
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                      overlayColor: MaterialStateProperty.all(
                        Colors.red.shade400.withOpacity(0.2),
                      ),
                    ),
                    child: Text(
                      Strings.forgotPassword.tr,
                      textAlign: TextAlign.end,
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    activeColor: theme.primaryColor,
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  Text(Strings.remember.tr),
                ],
              ),
              16.verticalSpace,
              CustomButton(
                text: Strings.enter.tr,
                hasShadow: false,
                onPressed: () {
                  if (controller.formKeySignIn.currentState!.validate()) {
                    Get.toNamed(Routes.BASE);
                  } else {
                    CustomSnackBar.showCustomErrorSnackBar(
                      title: Strings.error.tr,
                      message: Strings.invalidCredentials.tr,
                    );
                  }
                },
              ),
              16.verticalSpace,
              const CustomDivider(),
              16.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomIconButton(
                    onPressed: () {},
                    hasShadow: false,
                    path: Constants.facebookLogo,
                    imageWidth: 35,
                  ),
                  16.horizontalSpace,
                  CustomIconButton(
                    onPressed: () {},
                    hasShadow: false,
                    path: Constants.googleLogo,
                  ),
                  16.horizontalSpace,
                  CustomIconButton(
                    onPressed: () {},
                    hasShadow: false,
                    path: Constants.appleLogo,
                    imageWidth: 35,
                  ),
                ],
              ),
              16.verticalSpace,
              const CustomDontHaveAccount(),
            ],
          ),
        ),
      ),
    );
  }
}
