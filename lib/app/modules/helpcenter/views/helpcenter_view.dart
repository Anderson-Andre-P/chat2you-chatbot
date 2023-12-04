import 'package:chat2you/app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/header_widget.dart';
import '../controllers/helpcenter_controller.dart';

class HelpcenterView extends GetView<HelpcenterController> {
  const HelpcenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: CustomAppBar(
        hasDrawer: false,
        title: Strings.helpCenter.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.titleHelpCenter,
              style: theme.textTheme.titleLarge,
            ),
            16.verticalSpace,
            Text(
              Strings.informationHelpCenter.tr,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            16.verticalSpace,
            Text(
              Strings.frequentlyAskedQuestions.tr,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            8.verticalSpace,
            _buildFAQItem(
              context: context,
              question: 'How do I create an account?',
              answer:
                  'To create an account, click on the "Sign Up" button and follow the on-screen instructions.',
            ),
            _buildFAQItem(
              context: context,
              question: 'How do I reset my password?',
              answer:
                  'You can reset your password by clicking on the "Forgot Password" link on the login screen.',
            ),
            16.verticalSpace,
            CustomButton(
              text: Strings.contactSupport.tr,
              hasShadow: false,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(
      {required BuildContext context,
      required String question,
      required String answer}) {
    final theme = context.theme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          answer,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.normal,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
