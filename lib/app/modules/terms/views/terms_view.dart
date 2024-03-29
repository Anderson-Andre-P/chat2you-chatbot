import 'package:chat2you/app/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: CustomAppBar(
        hasDrawer: false,
        title: Strings.termsAndConditions.tr,
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Strings.titleTermsAndConditions.tr,
              style: theme.textTheme.titleLarge,
            ),
            16.verticalSpace,
            Text(
              Strings.informationOneOfTermsAndConditions.tr,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            16.verticalSpace,
            Text(
              Strings.informationTwoOfTermsAndConditions.tr,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.normal,
              ),
            ),
            24.verticalSpace,
            _termsItem(
              theme: theme,
              titleOfTerm: '1. Title of term',
              descriptionOfTerm:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
            ),
            _termsItem(
              theme: theme,
              titleOfTerm: '2. Title of term',
              descriptionOfTerm:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
            ),
            _termsItem(
              theme: theme,
              titleOfTerm: '3. Title of term',
              descriptionOfTerm:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ...',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _termsItem({
  required ThemeData theme,
  required String titleOfTerm,
  required String descriptionOfTerm,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        titleOfTerm,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      Text(
        descriptionOfTerm,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.normal,
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}
