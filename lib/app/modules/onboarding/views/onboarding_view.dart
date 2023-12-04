import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/custom_button.dart';
import '../../../routes/app_pages.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> _pages = [
    {
      'onboardingImage': Constants.onboardingImageOne.tr,
      'onboardingTitle': Strings.onboardingTitleOne.tr,
      'onboardingSubtitle': Strings.onboardingSubtitleOne.tr,
    },
    {
      'onboardingImage': Constants.onboardingImageTwo.tr,
      'onboardingTitle': Strings.onboardingTitleTwo.tr,
      'onboardingSubtitle': Strings.onboardingSubtitleTwo.tr,
    },
    {
      'onboardingImage': Constants.onboardingImageThree.tr,
      'onboardingTitle': Strings.onboardingTitleThree.tr,
      'onboardingSubtitle': Strings.onboardingSubtitleThree.tr,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return buildPage(
                  _pages[index]['onboardingImage']!,
                  _pages[index]['onboardingTitle']!,
                  _pages[index]['onboardingSubtitle']!,
                );
              },
            ),
            Positioned(
              bottom: 24,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: CustomButton(
                  text: Strings.skipOnboarding.tr,
                  hasShadow: false,
                  onPressed: () {
                    Get.offNamed(Routes.TYPEOFLOGIN);
                  },
                ),
              ),
            ),
            Positioned(
              bottom: 88,
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _pages.length,
                    (index) => buildIndicator(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String onboardingImage, String onboardingTitle,
      String onboardingSubtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            onboardingImage,
          ),
          16.verticalSpace,
          Text(
            onboardingTitle,
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.displayLarge?.copyWith(
              fontSize: 33.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          16.verticalSpace,
          Text(
            onboardingSubtitle,
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.displaySmall?.copyWith(
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          96.verticalSpace,
        ],
      ),
    );
  }

  Widget buildIndicator(int index) {
    return Container(
      width: index == _currentPage ? 10 : 20,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: index == _currentPage
            ? Get.theme.primaryColor
            : Get.theme.primaryColor.withOpacity(0.2),
      ),
    );
  }
}
