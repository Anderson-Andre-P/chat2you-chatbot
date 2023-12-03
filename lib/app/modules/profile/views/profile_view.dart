import 'package:chat2you/app/components/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/translations/strings_enum.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Strings.profile.tr,
        hasDrawer: false,
      ),
      body: const Center(
        child: Text("Profile View"),
      ),
    );
  }
}
