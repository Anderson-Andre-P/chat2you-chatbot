import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/custom_button.dart';
import '../../../components/custom_snackbar.dart';
import '../../../components/custom_text_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Conta'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.toNamed(Routes.SIGNIN);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 24.0.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Form(
              key: controller.formKeySignUp,
              child: Column(
                children: [
                  CustomTextField(
                    label: "Nome de usuário",
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                    controller: controller.usernameController,
                    validator: controller.validateUsername,
                  ),
                  16.verticalSpace,
                  CustomTextField(
                    label: Strings.email.tr,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.emailController,
                    validator: controller.validateEmail,
                  ),
                  16.verticalSpace,
                  CustomTextField(
                    label: Strings.password.tr,
                    prefixIcon: Icons.password,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    controller: controller.passwordController,
                    validator: controller.validatePassword,
                  ),
                  16.verticalSpace,
                  CustomTextField(
                    label: Strings.password.tr,
                    prefixIcon: Icons.password,
                    keyboardType: TextInputType.text,
                    isPassword: true,
                    controller: controller.confirmPasswordController,
                    validator: controller.validateConfirmPassword,
                  ),
                ],
              ),
            ),
            Column(
              children: [
                CustomButton(
                  text: Strings.enter.tr,
                  hasShadow: false,
                  onPressed: () {
                    if (controller.formKeySignUp.currentState!.validate()) {
                      // Chame a função para criar a conta aqui
                      // Por exemplo, controller.createAccount()
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
                CustomButton(
                  text: "Return",
                  hasShadow: false,
                  foregroundColor: theme.primaryColor,
                  backgroundColor: theme.scaffoldBackgroundColor,
                  borderColor: theme.primaryColor,
                  onPressed: () {
                    Get.toNamed(Routes.SIGNIN);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
