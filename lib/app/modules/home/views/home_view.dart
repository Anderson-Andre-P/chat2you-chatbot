import 'package:chat2you/app/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../../../../utils/constants.dart';
import '../../../components/custom_image_view.dart';
import '../../../components/header_widget.dart';
import '../../../routes/app_pages.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Drawer Example'),
      // ),
      appBar: CustomAppBar(
        title: Strings.titleOfTheApp.tr,
        hasDrawer: true,
        actionIcons: const [Icons.notifications_outlined],
        onIconPressed: [
          () {
            Scaffold.of(context).openDrawer();
          }
        ],
      ),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CustomImageView(
              imagePath: Constants.logo,
              width: 100.w,
            ),
            Text(
              Strings.welcomeTitle.tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 46.sp,
                fontWeight: FontWeight.normal,
                height: 1.2.h,
              ),
            ),
            Text(
              Strings.welcomeSubtitle.tr,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            CustomButton(
              text: Strings.startChatButton.tr,
              hasShadow: false,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(Strings.titleOfTheApp.tr),
    //     centerTitle: true,
    //   ),
    //   body: Column(
    //     children: [
    //       GetBuilder<HomeController>(
    //         builder: (_) {
    //           return Expanded(
    //             child: MyWidgetsAnimator(
    //               apiCallStatus: controller.apiCallStatus,
    //               loadingWidget: () => const Center(
    //                 child: CupertinoActivityIndicator(),
    //               ),
    //               errorWidget: () => ApiErrorWidget(
    //                 message: Strings.internetError.tr,
    //                 retryAction: () => controller.getData(),
    //                 padding: EdgeInsets.symmetric(horizontal: 24.w),
    //               ),
    //               successWidget: () => ListView.builder(
    //                 itemCount: controller.data['messages'].length,
    //                 itemBuilder: (context, index) {
    //                   final message = controller.data['messages'][index];
    //                   final isUserMessage = message.startsWith("User:");

    //                   return Align(
    //                     alignment: isUserMessage
    //                         ? Alignment.centerRight
    //                         : Alignment.centerLeft,
    //                     child: Container(
    //                       padding: EdgeInsets.all(16.0.w),
    //                       margin: EdgeInsets.only(
    //                         top: 16.0.h,
    //                         left: 24.0.w,
    //                         right: 24.0.w,
    //                       ),
    //                       decoration: BoxDecoration(
    //                         color: isUserMessage
    //                             ? theme.primaryColor
    //                             : theme.cardColor,
    //                         borderRadius: BorderRadius.circular(4.r),
    //                       ),
    //                       child: Text(
    //                         message.replaceFirst(
    //                             isUserMessage ? "User: " : "Bruna: ", ""),
    //                         style: theme.textTheme.bodyMedium?.copyWith(
    //                           fontSize: 14.sp,
    //                           color: isUserMessage
    //                               ? Theme.of(context).brightness ==
    //                                       Brightness.light
    //                                   ? const Color(0xFFFFFFFF)
    //                                   : const Color(0xFF6C6C6C)
    //                               : Theme.of(context).brightness ==
    //                                       Brightness.light
    //                                   ? const Color(0xFF6C6C6C)
    //                                   : const Color(0xFFFFFFFF),
    //                         ),
    //                       ),
    //                     ),
    //                   );
    //                 },
    //               ),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );
  }
}

void _openDrawer(BuildContext context) {
  Scaffold.of(context).openDrawer();
}

// void _openDrawer(BuildContext context) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return const CustomDrawer();
//     },
//   );
// }

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            accountEmail: Text("jodo.test.dwo@mail.com"),
            accountName: Text("John Doe"),
            currentAccountPicture: CircleAvatar(
              child: Text("JD"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outlined),
            title: Text(Strings.profile.tr),
            tileColor: Get.theme.scaffoldBackgroundColor,
            onTap: () => Get.toNamed(Routes.PROFILE),
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: Text(Strings.settings.tr),
            tileColor: Get.theme.scaffoldBackgroundColor,
            onTap: () => Get.to(() => const SettingsView()),
          ),
        ],
      ),
    );
  }
}
