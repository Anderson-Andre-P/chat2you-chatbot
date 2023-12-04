import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../components/header_widget.dart';
import '../controllers/privacypolicy_controller.dart';

class PrivacypolicyView extends GetView<PrivacypolicyController> {
  const PrivacypolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: CustomAppBar(
        hasDrawer: false,
        title: Strings.privacyPolicy.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Strings.titlePrivacyPolicy.tr,
                style: theme.textTheme.titleLarge,
              ),
              16.verticalSpace,
              Text(
                Strings.infotmationPrivacyPolicy.tr,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.normal,
                ),
              ),
              24.verticalSpace,
              _privacyItem(
                theme: theme,
                titleOfPrivacy: '1. Information We Collect',
                descriptionOfPrivacy:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
              ),
              _privacyItem(
                theme: theme,
                titleOfPrivacy: '2. How We Use Your Information',
                descriptionOfPrivacy:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _privacyItem({
  required ThemeData theme,
  required String titleOfPrivacy,
  required String descriptionOfPrivacy,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleOfPrivacy,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      Text(
        descriptionOfPrivacy,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
