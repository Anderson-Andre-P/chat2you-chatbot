import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../config/theme/dark_theme_colors.dart';
import '../../../../config/theme/light_theme_colors.dart';
import '../../../../config/translations/strings_enum.dart';
import '../../../components/custom_button.dart';
import '../../../components/header_widget.dart';
import '../controllers/upgradetopro_controller.dart';

class UpgradetoproView extends GetView<UpgradetoproController> {
  const UpgradetoproView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Upgrade to PRO!",
        hasDrawer: false,
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          UpgradePlanWidget(),
        ],
      ),
    );
  }
}

class UpgradePlanWidget extends StatelessWidget {
  const UpgradePlanWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 24,
        bottom: 200,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width - 40.0,
        // height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF284BFF),
              Color(0xFFB633FF),
            ],
            transform: GradientRotation(90),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  const Row(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'Plus',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30.0,
                            ),
                          ),
                          Text(
                            ' \u00244.99',
                            style:
                                TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                          Text(
                            '/month',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor:
                          Get.theme.dividerColor, // Escolha a cor desejada
                    ),
                    child: DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Funtionality',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Have',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.advancedAssitance.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.accessToExclusiveContent.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.prioritySupport.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.customizingAutomaticReplies.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.detailedAnalysis.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.offlineAccess.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                Strings.integrationWithSocialNetworks.tr,
                                style: Get.theme.textTheme.bodyLarge?.copyWith(
                                  // fontSize: 14.sp,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const DataCell(
                              Icon(
                                Icons.close,
                                color: Colors.white54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  24.verticalSpace,
                  CustomButton(
                    text: 'Get Started',
                    width: 320,
                    hasShadow: false,
                    backgroundColor: Get.theme.brightness == Brightness.dark
                        ? LightThemeColors.accentColor
                        : DarkThemeColors.accentColor,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
