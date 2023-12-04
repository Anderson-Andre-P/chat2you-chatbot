import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PulsatingLoadingIndicator extends StatefulWidget {
  const PulsatingLoadingIndicator({super.key});

  @override
  _PulsatingLoadingIndicatorState createState() =>
      _PulsatingLoadingIndicatorState();
}

class _PulsatingLoadingIndicatorState extends State<PulsatingLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animationController.drive(
          CurveTween(curve: Curves.easeInOut),
        ),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
