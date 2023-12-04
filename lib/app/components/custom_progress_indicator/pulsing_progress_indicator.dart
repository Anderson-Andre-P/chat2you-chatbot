import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PulsingLoadingIndicator extends StatefulWidget {
  const PulsingLoadingIndicator({super.key});

  @override
  _PulsingLoadingIndicatorState createState() =>
      _PulsingLoadingIndicatorState();
}

class _PulsingLoadingIndicatorState extends State<PulsingLoadingIndicator>
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
    final theme = context.theme;
    return Center(
      child: ScaleTransition(
        scale: _animation,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: theme.primaryColor,
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
