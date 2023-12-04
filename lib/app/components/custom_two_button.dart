import 'package:chat2you/app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTwoButton extends StatelessWidget {
  final String cancelText;
  final String okayText;
  final void Function()? cancelOnPressed;
  final void Function()? onkayOnPressed;

  const CustomTwoButton({
    super.key,
    required this.cancelText,
    required this.okayText,
    required this.cancelOnPressed,
    required this.onkayOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomButton(
            text: cancelText,
            onPressed: cancelOnPressed,
            hasShadow: false,
            backgroundColor: theme.primaryColor.withOpacity(0.0),
            borderColor: theme.primaryColor,
          ),
        ),
        16.horizontalSpace,
        Expanded(
          child: CustomButton(
            text: okayText,
            hasShadow: false,
            onPressed: onkayOnPressed,
          ),
        ),
      ],
    );
  }
}
