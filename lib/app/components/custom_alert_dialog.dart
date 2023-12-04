import 'package:chat2you/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../config/translations/strings_enum.dart';
import 'custom_two_button.dart';

enum AlertType { alert, success, info, warning }

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onOkayPressed;
  final VoidCallback onCancelPressed;
  final bool alignCenter;
  final AlertType type;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onOkayPressed,
    required this.onCancelPressed,
    this.alignCenter = true,
    this.type = AlertType.alert,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: _buildDialogContent(context),
    );
  }

  Widget _buildDialogContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: 24.0.h,
        left: 24.w,
        right: 24.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildAnimatedSvg(),
          _buildTitle(),
          16.verticalSpace,
          _buildContent(),
          16.verticalSpace,
          _buildButtons(context),
        ],
      ),
    );
  }

  Widget _buildAnimatedSvg() {
    String imgPath;
    // Color backgroundColor;

    switch (type) {
      case AlertType.alert:
        imgPath = Constants.alertRed;
        break;
      case AlertType.success:
        imgPath = Constants.alertGreen;
        break;
      case AlertType.info:
        imgPath = Constants.alertBlue;
        break;
      case AlertType.warning:
        imgPath = Constants.alertYellow;
        break;
    }

    return Container(
      // color: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Lottie.asset(
        imgPath,
        width: 120.0,
        height: 120.0,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildTitle() {
    String title;

    switch (type) {
      case AlertType.alert:
        title = Strings.alert.tr;
        break;
      case AlertType.success:
        title = Strings.success.tr;
        break;
      case AlertType.info:
        title = Strings.info.tr;
        break;
      case AlertType.warning:
        title = Strings.warning.tr;
        break;
    }

    return Text(
      title,
      style: Get.theme.textTheme.headlineSmall,
    );
  }

  Widget _buildContent() {
    return Text(
      content,
      textAlign: TextAlign.center,
      style: Get.theme.textTheme.bodyLarge?.copyWith(
        fontWeight: FontWeight.normal,
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return CustomTwoButton(
      cancelText: Strings.cancel.tr,
      okayText: Strings.okay.tr,
      cancelOnPressed: () {
        Navigator.pop(context);
        onCancelPressed();
      },
      onkayOnPressed: () {
        Navigator.pop(context);
        onOkayPressed();
      },
    );
  }

  void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return this;
      },
    );
  }
}
