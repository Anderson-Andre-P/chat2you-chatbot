import 'package:chat2you/app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotFound404Error extends StatelessWidget {
  const NotFound404Error({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/certain_error.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          const Positioned(
            bottom: 230,
            left: 30,
            child: Text(
              'Dead End',
            ),
          ),
          const Positioned(
            bottom: 170,
            left: 30,
            child: Text(
              'Oops! The page you are looking for\nis not found',
              textAlign: TextAlign.start,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 250,
            child: CustomButton(
              text: 'Return',
              onPressed: () => {},
              fontSize: 16.sp,
              radius: 50.r,
              verticalPadding: 16.h,
              hasShadow: false,
            ),
          ),
        ],
      ),
    );
  }
}
