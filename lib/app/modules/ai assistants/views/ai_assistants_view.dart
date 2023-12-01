import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../components/custom_filter_chip.dart';
import '../../../components/custom_image_view.dart';
import '../../../components/header_widget.dart';
import '../controllers/ai_assistants_controller.dart';
import '../model/ai_assistants_model.dart';

class AiAssistantsView extends GetView<AiAssistantsController> {
  const AiAssistantsView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: const CustomAppBar(
        title: "AI Assistants",
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 24.w, right: 16.w),
                      child: CustomFilterChip(
                        label: 'All',
                        selected: controller.selectedCategory.value == 'All',
                        onSelected: () {
                          controller.selectedCategory.value = 'All';
                        },
                      ),
                    ),
                    for (final category in controller.getCategories())
                      if (category != 'All')
                        Padding(
                          padding: EdgeInsets.only(
                            right: 16.w,
                          ),
                          child: CustomFilterChip(
                            label: category,
                            selected:
                                controller.selectedCategory.value == category,
                            onSelected: () {
                              controller.selectedCategory.value = category;
                            },
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0.w, vertical: 0.h),
              child: Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  scrollDirection: Axis.vertical,
                  itemCount: controller.filteredAssistants.length,
                  itemBuilder: (BuildContext context, int index) {
                    final AiAssistant assistant =
                        controller.filteredAssistants[index];
                    return Card(
                      color: theme.cardColor,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        side: BorderSide(
                          width: 1.0,
                          color: theme.focusColor,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: assistant.color,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    4.r,
                                  ),
                                ),
                              ),
                              child: CustomImageView(
                                imagePath: assistant.imagePath,
                                width: 50.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              assistant.title,
                              style: theme.textTheme.displaySmall?.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                height: 1.15,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              assistant.description,
                              style: theme.textTheme.bodySmall?.copyWith(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
