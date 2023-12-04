import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinearLoadingIndicator extends StatelessWidget {
  const LinearLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Center(
      child: Container(
        width: 200,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(color: theme.cardColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            backgroundColor: theme.cardColor,
            valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
