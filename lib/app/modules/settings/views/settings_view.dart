import 'package:chat2you/app/components/header_widget.dart';
import 'package:chat2you/app/modules/settings/views/widgets/settings_list.dart';
import 'package:chat2you/config/translations/strings_enum.dart';
import 'package:chat2you/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/my_theme.dart';
import '../../../../config/translations/localization_service.dart';
import '../../../components/custom_banner.dart';
import '../../../routes/app_pages.dart';
import '../controllers/settings_controller.dart';
import 'widgets/user_settings.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.settings.tr,
        hasDrawer: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserSettingsItem(
                name: Strings.name.tr,
                email: Strings.emailAddres.tr,
                icon: Icons.arrow_forward_outlined,
                onPressed: () {
                  Get.offNamed(Routes.PROFILE);
                },
              ),
              16.verticalSpace,
              CustomBanner(
                imagePath: Constants.starToBanner,
                title: Strings.titleBanner.tr,
                subtitle: Strings.subtitleBanner.tr,
                icon: Icons.arrow_forward_outlined,
                onPressed: () {
                  Get.offNamed(Routes.UPGRADETOPRO);
                },
              ),
              16.verticalSpace,
              SettingsList(
                titleOfList: Strings.general.tr,
                items: [
                  SettingsItem(
                    icon: Icons.person_outline,
                    phrase: Strings.personalInfo.tr,
                    arrowIcon: Icons.arrow_forward_outlined,
                    onPressed: () {},
                  ),
                  SettingsItem(
                    icon: Icons.security_outlined,
                    phrase: Strings.security.tr,
                    arrowIcon: Icons.arrow_forward,
                    onPressed: () {
                      // Navegação para a nova página desejada
                    },
                  ),
                  SettingsItem(
                    icon: Icons.translate_outlined,
                    phrase: Strings.changeLanguage.tr,
                    arrowIcon: Icons.arrow_forward_outlined,
                    onPressed: () {
                      LocalizationService.updateLanguage(
                        LocalizationService.getCurrentLocal().languageCode ==
                                'en'
                            ? 'pt'
                            : 'en',
                      );
                    },
                  ),
                  SettingsItem(
                    icon: Icons.swap_horiz_outlined,
                    phrase: Strings.toggleTheme.tr,
                    arrowIcon: Icons.arrow_forward,
                    isToggle: true,
                    onToggle: (value) {
                      MyTheme.changeTheme();
                    },
                  ),
                ],
              ),
              16.verticalSpace,
              SettingsList(
                titleOfList: Strings.about.tr,
                items: [
                  SettingsItem(
                    icon: Icons.help_outline,
                    phrase: Strings.helpCenter.tr,
                    arrowIcon: Icons.arrow_forward,
                    onPressed: () {
                      Get.offNamed(Routes.HELPCENTER);
                    },
                  ),
                  SettingsItem(
                    icon: Icons.lock_outline,
                    phrase: Strings.privacyPolicy.tr,
                    arrowIcon: Icons.arrow_forward,
                    onPressed: () {
                      Get.offNamed(Routes.PRIVACYPOLICY);
                    },
                  ),
                  SettingsItem(
                    icon: Icons.info_outline,
                    phrase: Strings.termsAndConditions.tr,
                    arrowIcon: Icons.arrow_forward,
                    onPressed: () {
                      Get.offNamed(Routes.TERMS);
                    },
                  ),
                  SettingsItem(
                    icon: Icons.logout_outlined,
                    iconColor: Colors.red,
                    phraseColor: Colors.red,
                    phrase: Strings.logout.tr,
                    arrowIcon: Icons.arrow_forward,
                    onPressed: () {
                      // Navegação para a nova página desejada
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
