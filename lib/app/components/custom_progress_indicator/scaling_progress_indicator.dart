import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScalingLoadingIndicator extends StatefulWidget {
  const ScalingLoadingIndicator({super.key});

  @override
  _ScalingLoadingIndicatorState createState() =>
      _ScalingLoadingIndicatorState();
}

class _ScalingLoadingIndicatorState extends State<ScalingLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _animation,
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
    _controller.dispose();
    super.dispose();
  }
}
