import 'package:chat2you/app/modules/ai%20assistants/views/ai_assistants_view.dart';
import 'package:chat2you/app/modules/history/views/history_view.dart';
import 'package:chat2you/config/translations/strings_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../controllers/base_controller.dart';

class BaseView extends GetView<BaseController> {
  const BaseView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return GetBuilder<BaseController>(
      builder: (_) => Scaffold(
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeView(),
              AiAssistantsView(),
              HistoryView(),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.r),
              topRight: Radius.circular(0.r),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0,
                blurRadius: 1,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0.r),
              topRight: Radius.circular(0.r),
            ),
            child: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              type: BottomNavigationBarType.fixed,
              elevation: 0.0,
              backgroundColor: theme.scaffoldBackgroundColor,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedFontSize: 12.sp,
              selectedItemColor: theme.primaryColor,
              items: [
                _mBottomNavItem(
                  label: Strings.chat.tr,
                  icon: Icons.home_outlined,
                ),
                _mBottomNavItem(
                  label: Strings.aiAssistants.tr,
                  icon: Icons.grid_view_outlined,
                ),
                _mBottomNavItem(
                  label: Strings.history.tr,
                  icon: Icons.history_outlined,
                ),
              ],
              onTap: controller.changeScreen,
            ),
          ),
        ),
      ),
    );
  }

  _mBottomNavItem({required String label, required IconData icon}) {
    return BottomNavigationBarItem(
      label: label,
      icon: Icon(
        icon,
      ),
      activeIcon: Icon(
        icon,
        color: const Color(0xFF2563EB),
      ),
    );
  }
}
