import 'package:chat2you/app/components/custom_image_view.dart';
import 'package:chat2you/config/translations/strings_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/constants.dart';
import '../../../components/header_widget.dart';
import '../controllers/history_controller.dart';
import 'chat_details_view.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Scaffold(
      appBar: CustomAppBar(
        title: "Chat History",
        hasDrawer: false,
        actionIcons: const [Icons.search, Icons.delete],
        onIconPressed: [
          () {
            showSearch(
              context: context,
              delegate: ChatSearchDelegate(controller),
            );
          },
          () {
            // Lógica para o ícone de configurações
          },
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: GetBuilder<HistoryController>(
          builder: (controller) {
            return ListView.separated(
              itemCount: controller.filteredChats.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    controller.filteredChats[index].title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.displaySmall?.copyWith(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      height: 1.15,
                    ),
                  ),
                  subtitle: Text(
                    controller.filteredChats[index].subtitle,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  dense: true,
                  tileColor: theme.cardColor,
                  trailing: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 14,
                  ),
                  onTap: () {
                    Get.to(
                      () => ChatDetailsView(
                        chat: controller.filteredChats[index],
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          },
        ),
      ),
    );
  }
}

class ChatSearchDelegate extends SearchDelegate<String> {
  final HistoryController controller;
  bool _isSearching = false;
  ChatSearchDelegate(this.controller);

  appBar(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    InputDecorationTheme(
      hintStyle: theme.textTheme.bodyLarge?.copyWith(
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
      ),
      filled: true,
      fillColor: theme.scaffoldBackgroundColor,
      border: InputBorder.none,
      isDense: true,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        _isSearching = false;
        controller.filterChats('');
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (!_isSearching) {
      _isSearching = true;
      controller.filterChats(query);
    }
    return _buildSearchResults(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (!_isSearching) {
      _isSearching = true;
      controller.filterChats(query);
    }
    return _buildSearchResults(context);
  }

  Widget _buildSearchResults(BuildContext context) {
    ThemeData theme = Theme.of(context);

    if (query.isEmpty) {
      controller.filterChats('');
    } else {
      controller.filterChats(query);
    }

    if (controller.filteredChats.isEmpty) {
      return Container(
        padding: EdgeInsets.all(24.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImageView(
              imagePath: Theme.of(context).brightness == Brightness.light
                  ? Constants.noDataLight
                  : Constants.noDataDark,
            ),
            16.verticalSpace,
            Text(
              Strings.notFound,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayLarge?.copyWith(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            16.verticalSpace,
            Text(
              Strings.notFoundSorry,
              textAlign: TextAlign.center,
              style: theme.textTheme.displayMedium?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: ListView.separated(
        itemCount: controller.filteredChats.length,
        itemBuilder: (context, index) {
          final theme = context.theme;

          return ListTile(
            title: Text(
              controller.filteredChats[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.displaySmall?.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                height: 1.15,
              ),
            ),
            subtitle: Text(
              controller.filteredChats[index].subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.r),
            ),
            dense: true,
            tileColor: theme.cardColor,
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14,
            ),
            onTap: () {
              Get.to(
                () => ChatDetailsView(
                  chat: controller.filteredChats[index],
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
    );
  }
}
