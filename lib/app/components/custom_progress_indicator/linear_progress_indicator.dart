import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinearLoadingIndicator extends StatelessWidget {
  const LinearLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(color: Get.theme.cardColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor: Get.theme.cardColor,
            valueColor: AlwaysStoppedAnimation<Color>(Get.theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
