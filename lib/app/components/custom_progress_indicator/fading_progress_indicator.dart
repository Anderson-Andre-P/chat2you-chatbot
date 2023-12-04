import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadingLoadingIndicator extends StatefulWidget {
  const FadingLoadingIndicator({super.key});

  @override
  _FadingLoadingIndicatorState createState() => _FadingLoadingIndicatorState();
}

class _FadingLoadingIndicatorState extends State<FadingLoadingIndicator>
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
    _animation = Tween<double>(begin: 0.2, end: 1.0).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _animation,
        child: Container(
          width: 50,
          height: 50,
          color: Get.theme.primaryColor,
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
