import 'package:chat2you/app/components/custom_image_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  final String path;
  final Color? backgroundColor;
  final bool hasShadow;
  final Color? shadowColor;
  final double shadowOpacity;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  // final VoidCallback? onPressed;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final bool disabled;
  final double? imageWidth;

  const CustomIconButton({
    super.key,
    required this.path,
    this.onPressed,
    this.hasShadow = true,
    this.shadowColor,
    this.shadowOpacity = 0.3,
    this.shadowBlurRadius = 3,
    this.shadowSpreadRadius = 1,
    this.backgroundColor,
    this.disabled = false,
    this.foregroundColor,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: hasShadow ? EdgeInsets.all(4.r) : EdgeInsets.zero,
      child: SizedBox(
        width: 60.w,
        height: 60.h,
        child: ElevatedButton(
          onPressed: !disabled ? onPressed : null,
          style: ElevatedButton.styleFrom(
            shadowColor:
                const Color.fromARGB(50, 0, 0, 0).withOpacity(shadowOpacity),
            backgroundColor: !disabled
                ? backgroundColor ?? Get.theme.cardColor
                : Get.theme.primaryColor.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Get.theme.highlightColor,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(4.r),
            ),
            foregroundColor: foregroundColor ?? Colors.white,
          ),
          child: CustomImageView(
            svgPath: path,
            width: imageWidth ?? 30.w,
          ),
        ),
      ),
    );
  }
}
