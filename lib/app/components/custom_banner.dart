import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBanner extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onPressed;

  const CustomBanner({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.r,
            ),
          ),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF284BFF),
              Color(0xFFB633FF),
            ],
            transform: GradientRotation(90),
          ),
        ),
        padding: EdgeInsets.all(16.w),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              height: 60,
              width: 60,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              icon,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
