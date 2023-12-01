import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final double? radius;
  final double? fontSize;
  final Gradient? gradient;
  final void Function()? onPressed;
  final FontWeight? fontWeight;
  final double? spacing;
  final Widget? icon;
  final Color? borderColor;
  final bool hasShadow;
  final Color? shadowColor;
  final double shadowOpacity;
  final double shadowBlurRadius;
  final double shadowSpreadRadius;
  final double? width;
  final double? height;
  final double? verticalPadding;
  final bool disabled;

  const CustomButton({
    super.key,
    this.icon,
    this.spacing,
    required this.text,
    required this.onPressed,
    this.fontWeight,
    this.gradient,
    this.backgroundColor,
    this.fontSize,
    this.foregroundColor,
    this.radius,
    this.borderColor,
    this.hasShadow = true,
    this.shadowColor,
    this.shadowOpacity = 0.3,
    this.shadowBlurRadius = 3,
    this.shadowSpreadRadius = 1,
    this.width,
    this.height,
    this.verticalPadding,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 0,
      borderRadius: BorderRadius.circular(radius ?? 4.r),
      child: Container(
        padding: hasShadow ? EdgeInsets.all(4.r) : EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(radius ?? 4.r),
          onTap: !disabled ? onPressed : null,
          child: Ink(
            width: width ?? double.infinity,
            height: height,
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: verticalPadding ?? 16.h,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                radius ?? 4.r,
              ),
              border: Border.all(color: borderColor ?? Colors.transparent),
              color: !disabled
                  ? backgroundColor ?? Get.theme.primaryColor
                  : Get.theme.primaryColor.withOpacity(0.5),
              gradient: gradient,
              boxShadow: !hasShadow || disabled
                  ? null
                  : [
                      BoxShadow(
                        color:
                            (shadowColor ?? const Color.fromARGB(50, 0, 0, 0))
                                .withOpacity(shadowOpacity),
                        spreadRadius: shadowSpreadRadius,
                        blurRadius: shadowBlurRadius,
                        offset: const Offset(0, 2),
                      ),
                    ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: Get.theme.textTheme.bodySmall?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: foregroundColor ?? Colors.white,
                  ),
                ),
                if (icon != null)
                  SizedBox(
                    width: spacing ?? 10.w,
                  ),
                if (icon != null) icon!
              ],
            ),
          ),
        ),
      ),
    );
  }
}
